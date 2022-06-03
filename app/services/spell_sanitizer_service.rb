class SpellSanitizerService < ApplicationService
  def initialize(unsanitized_spell)
    @element =   unsanitized_spell
    @attributes = {}
    super()
  end

  def call
    super
    Spell.create!(attributes)
  end

  private

  def assign_column(line)
    column, value = line.split('=')
    value = value[1..-2] # value without quotation marks

    case column
    when 'casting'                 then assign_casting(value)
    when 'range'                   then assign_range(value)
    when 'components'              then assign_components(value)
    when 'duration'                then assign_duration(value)
    when 'classes', 'rulebook'     then assign_array(column, value)
    when 'ritual', 'concentration' then assign_boolean(column, value)
    else attributes[column] = value
    end
  end

  def assign_casting(casting)
    attributes[:original_casting] = casting
    attributes[:casting] = if casting.split(',').first == '1 reakce'
                             Spell::CASTING[casting.split(',').first]
                           else
                             Spell::CASTING[casting]
                           end
  end

  def assign_range(range)
    attributes[:original_range] = range
    # swap "sesilatel" for "ty sam" and parenthesis content for "oblast"
    range = range.gsub('Sesilatel', 'Ty sám').gsub(/\(([^)]+)\)/, '(oblast)')
    attributes[:range] = Spell::RANGE[range]
  end

  def assign_components(components)
    attributes[:original_components] = components
    components = components.include?(' zl') ? "#{components.split(' (').first}, zl" : components.split(' (').first
    attributes[:components] = components
  end

  def assign_duration(duration)
    attributes[:original_duration] = duration
    duration = duration.gsub('až ', '').gsub('Až ', '').split(' ')
    attributes[:duration] = if duration.first == 'Soustředění,'
                              Spell::DURATION[duration[1..].join(' ')]
                            else
                              Spell::DURATION[duration.join(' ')]
                            end
  end

  def assign_array(column, value)
    value = value.split(', ').map(&:capitalize)
    attributes[column] = value
  end

  def assign_boolean(column, value)
    attributes[column] = value == 'true'
  end
end
