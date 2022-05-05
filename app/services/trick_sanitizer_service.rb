class TrickSanitizerService < ApplicationService
  attr_reader :un_trick
  attr_accessor :attributes

  def initialize(unsanitized_trick)
    @un_trick =   unsanitized_trick
    @attributes = { dials: [] }
    super()
  end

  def call
    assign_columns
    assign_description
    Fate::Trick.create!(attributes)
  end

  private

  def assign_columns
    un_trick.each_line do |line|
      line = line.strip
      break if line == '>'
      next if line.blank?

      assign_column(line)
    end
  end

  def assign_column(line)
    column, value = line.split('=')
    column = column == 'type' ? :trick_type : column.underscore.to_sym
    value = value[1..-2] # value without quotation marks

    unless Fate::Trick::STRING_COLUMNS.include?(column)
      value = value.split(', ')
      assign_dial(value) if column.to_s.include?('_') && column != :trick_type
    end

    attributes[column] = value
  end

  def assign_dial(values)
    values.each do |value|
      attributes[:dials] << value unless attributes[:dials].include?(value)
    end
  end

  def assign_description
    attributes[:description] = un_trick.split(">\n").last.strip
  end
end
