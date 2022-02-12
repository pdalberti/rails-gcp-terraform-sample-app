class SpellSanitizerService < ApplicationService
  attr_reader :un_spell
  attr_accessor :attributes

  CANTRIP_SCHOOLS = {
    iluzorní: 'Iluze',
    nekromantický: 'Nekromancie',
    očarovací: 'Očarování',
    transmutační: 'Transmutace',
    vymítací: 'Vymítání',
    vyvolávací: 'Vyvolávání',
    věštecký: 'Věštění',
    zaklínací: 'Zaklínání'
  }.freeze

  def initialize(unsanitized_spell)
    @un_spell =   unsanitized_spell.split("\n\n")
    @attributes = { description: unsanitized_spell }
  end

  def call
    assign_name
    assign_school_level_and_ritual
    assign_casting
    assign_range
    assign_components
    assign_duration_and_concentration
    Spell.create!(attributes)
  end

  private

  def assign_name
    # "ANTIMAGICKÉ POLE"
    attributes[:name] = un_spell.first
  end

  def assign_school_level_and_ritual
    # "*Vyvolávání 6. úrovně (rituál)*"
    words = un_spell[1].split(' ')
    school = words.first[1..]
    attributes[:school] = CANTRIP_SCHOOLS[school.downcase.to_sym] || school
    attributes[:level] = words[1].to_i
    attributes[:ritual] = words.last == '(rituál)*'
  end

  def assign_casting
    # "**Vyvolání:** 1 akce"
    attributes[:casting] = non_bold_text(un_spell[2])
  end

  def assign_range
    # "**Dosah:** Ty sám (koule o poloměru 2 sáhy)"
    attributes[:range] = non_bold_text(un_spell[3])
  end

  def assign_components
    # "**Složky:** P. S (inkoust na bázi olova v hodnotě aspoň 10 zl, který kouzlo spotřebuje)"
    ############ REWORK using N-N table
    # components = non_bold_text(un_spell[4])
    # attributes[:components] = if components.include?('(')
    #                 text = text_between_parentheses(components)
    #                 if text.include?(' zl')
    #                   value = extract_value(text, text.index(' zl'))
    #                   "#{components.split('(').first}(#{value}#{text.include?('aspoň') ? '+' : ''} zl)"
    #                 else
    #                   components.split(' (').first
    #                 end
    #               else
    #                 components
    #               end
  end

  def assign_duration_and_concentration
    # "**Trvání:** Soustředění, až 1 hodina"
    duration = non_bold_text(un_spell[5]).split(' ')
    concentration = duration.first == 'Soustředění,'
    attributes[:concentration] = concentration
    attributes[:duration] = concentration ? duration[1..].join(' ').capitalize : duration.join(' ')
  end

  # helper methods
  ########################################

  def non_bold_text(string)
    string.split('** ').last
  end

  # def text_between_parentheses(string)
  #   string[/\((.*?)\)/m, 1]
  # end
end
