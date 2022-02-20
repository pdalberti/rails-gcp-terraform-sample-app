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
    assign_en_name
    assign_source
    assign_school_level_and_ritual
    assign_casting
    assign_range
    assign_components
    assign_duration_and_concentration
    assign_dnd_classes
    Spell.create!(attributes)
  end

  private

  def assign_name
    # "ANTIMAGICKÉ POLE"
    attributes[:name] = un_spell.first[2..]
  end

  def assign_en_name
    # "*Aganazzar's scorcher*"
    attributes[:en_name] = un_spell[1].gsub('*', '')
  end

  def assign_source
    # "***Xanatharuv pruvodce vším***"
    sources = un_spell[2].gsub('*', '')
    attributes[:rulebooks] = Rulebook.where(name: sources)
  end

  def assign_school_level_and_ritual
    # "*Vyvolávání 6. úrovně (rituál)*"
    words = un_spell[3].split(' ')
    school = words.first[1..]
    attributes[:school] = CANTRIP_SCHOOLS[school.downcase.to_sym] || school
    attributes[:level] = words[1].to_i
    attributes[:ritual] = words.last == '(rituál)*'
  end

  def assign_casting
    # "**Vyvolání:** 1 reakce, kterou provedeš jako odpověď na zranění způsobené tvorem do 12 sáhů od tebe, kterého vidíš"
    casting = non_bold_text(un_spell[4])
    attributes[:casting] = if casting.split(',').first == '1 reakce'
                             Spell::CASTING[casting.split(',').first]
                           else
                             Spell::CASTING[casting]
                           end
  end

  def assign_range
    # "**Dosah:** Ty sám (koule o poloměru 2 sáhy)"
    range = non_bold_text(un_spell[5])
    range = range.start_with?('Ty sám (') ? 'Ty sám (oblast)' : range
    attributes[:range] = Spell::RANGE[range]
  end

  def assign_components
    # "**Složky:** P, S (inkoust na bázi olova v hodnotě aspoň 10 zl, který kouzlo spotřebuje)"
    components = non_bold_text(un_spell[6])
    components = components.include?(' zl') ? "#{components.split(' (').first}, zl" : components.split(' (').first
    attributes[:components] = components
  end

  def assign_duration_and_concentration
    # "**Trvání:** Soustředění, až 1 hodina"
    duration = non_bold_text(un_spell[7]).split(' ')
    concentration = duration.first == 'Soustředění,'
    attributes[:concentration] = concentration
    attributes[:duration] = if concentration
                              Spell::DURATION[duration[2..].join(' ')]
                            else
                              Spell::DURATION[duration.join(' ')]
                            end
  end

  def assign_dnd_classes
    # "**Povolání:** Čaroděj, kouzelník"
    classes = non_bold_text(un_spell[8]).split(', ').map(&:capitalize)
    attributes[:dnd_classes] = DndClass.where(name: classes)
  end

  # helper methods
  ########################################

  def non_bold_text(string)
    string.split('** ').last
  end

  def text_between_parentheses(string)
    string[/\((.*?)\)/m, 1]
  end
end
