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

      assign_column(line)
    end
  end

  def assign_colum(line)
    column, value = line.split('=')
    value = value[1..-2] # value without quotation marks

    attributes[column] = value
  end

  def assign_description
    attributes[:description] = element.split(">\n").last.strip
  end

  def bold_text(string, boldening_level)
    case boldening_level
    when 1 then string[/\*(.*?)\*/m, 1]
    when 2 then string[/\*\*(.*?)\*\*/m, 1]
    when 3 then string[/\*\*\*(.*?)\*\*\*/m, 1]
    end
  end

  def non_bold_text(string)
    string.split('** ').last
  end

  def text_between_parentheses(string)
    string[/\((.*?)\)/m, 1]
  end
end

# move initializer, attr_reader element, attr_accessor attributes
# #call with #assign_columns and #assign_description
# maybe even
    # column, value = line.split('=')
    # value = value[1..-2] # value without quotation marks
