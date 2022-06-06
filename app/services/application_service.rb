class ApplicationService
  attr_reader :element
  attr_accessor :attributes

  def self.call(*args, &block)
    new(*args, &block).call
  end

  def call
    assign_columns
    assign_description
  end

  private

  def assign_columns
    element.each_line do |line|
      line = line.strip
      break if line == '>'
      next if line.blank?

      column, value = split_line(line)
      assign_column(column, value)
    end
  end

  def split_line(line)
    column, value = line.split('=')
    value = value[1..-2] # value without quotation marks
    column = column.underscore
    [column, value]
  end

  def assign_column(column, value)
    return if value.blank?

    attributes[column] = value
  end

  def assign_description
    attributes[:description] = element.split(">\n")[1..].join(">\n").strip
  end

  def assign_array(column, value)
    value = value.split(', ').map(&:capitalize)
    attributes[column] = value
  end

  def assign_unmodified_array(column, value)
    value = value.split(', ')
    attributes[column] = value
  end

  def assign_boolean(column, value)
    attributes[column] = value == 'true'
  end
end
