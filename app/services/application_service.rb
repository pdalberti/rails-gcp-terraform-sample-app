class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  private

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
