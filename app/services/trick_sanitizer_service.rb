class TrickSanitizerService < ApplicationService
  attr_reader :un_trick, :star_wars, :trick
  attr_accessor :attributes, :dials

  COLUMNS = {
    'Typ:' => :trick_type,
    'Tag:' => :tag,
    'Omezení:' => :restriction,
    'Cena:' => nil,
    'Akce:' => :action
  }.freeze

  SKIPPABLE_COLUMNS = %w[Zdroj: Cena:].freeze

  def initialize(unsanitized_trick)
    @un_trick =   unsanitized_trick.split("\n\n")
    @star_wars =  un_trick[1].starts_with?('***') # rulebook name
    @attributes = { description: unsanitized_trick }
    @dials = {}
    super()
  end

  def call
    assign_name
    assign_en_name unless star_wars
    assign_rulebook(1 + index_modifier)
    assign_other_columns
    @trick = Fate::Trick.create!(attributes)
    create_dials
    trick
  end

  private

  def assign_name
    # "Gravitační akrobacie"
    attributes[:name] = un_trick.first
  end

  def assign_en_name
    # *Energy Blast*
    attributes[:en_name] = bold_text(un_trick[1], 1)
  end

  def assign_rulebook(idx)
    attributes[:fate_rulebook] = Fate::Rulebook.find_by(name: bold_text(un_trick[idx], 3))
  end

  def assign_other_columns
    un_trick[(2 + index_modifier)..].each do |line|
      next unless line.starts_with?('*') # description
      next if non_bold_text(line.strip) == line.strip # empty value
      next if SKIPPABLE_COLUMNS.include?(bold_text(line, 2))

      if COLUMNS[bold_text(line, 2)]
        assign_column(line)
      else
        dials[bold_text(line, 2)[0..-2]] = non_bold_text(line)
      end
    end
  end

  def assign_column(line)
    attributes[COLUMNS[bold_text(line, 2)]] = non_bold_text(line)
  end

  def create_dials
    dials.each do |k, v|
      v.split(', ').each do |name|
        create_dial(k, name)
      end
    end
  end

  def create_dial(chapter, name)
    Fate::Dial.create!(
      fate_trick: trick,
      fate_chapter: Fate::Chapter.find_by(name: chapter),
      name: name
    )
  end

  # HELPER methods

  def index_modifier
    star_wars ? 0 : 1
  end
end
