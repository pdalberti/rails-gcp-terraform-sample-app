module Fate
  class TrickSanitizerService < ApplicationService
    def initialize(unsanitized_trick)
      @element =   unsanitized_trick
      @attributes = { dials: [] }
      super()
    end

    def call
      super
      Fate::Trick.create!(attributes)
    end

    private

    def assign_column(column, value)
      column = column == 'type' ? :trick_type : column.underscore.to_sym

      unless Fate::Trick::STRING_COLUMNS.include?(column)
        value = value.split(', ')
        assign_dial(value) if column.to_s.include?('_') && column != :trick_type
      end

      super(column, value)
    end

    def assign_dial(values)
      values.each do |value|
        attributes[:dials] << value unless attributes[:dials].include?(value)
      end
    end
  end
end
