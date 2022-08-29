module Drd2
  class AbilitySanitizerService < ApplicationService
    def initialize(unsanitized_ability)
      @element =    unsanitized_ability
      @attributes = { race_and_class: [] }
      super()
    end

    def call
      super
      Drd2::Ability.create!(attributes)
    end

    private

    def split_line(line)
      line.gsub!('attribute="', 'drd2_attribute="')
      super
    end

    def assign_column(column, value)
      assign_race_and_class(value) if Drd2::Ability::RACE_AND_CLASS.include?(column) && value.present?

      case column
      when 'related_skill', 'effect', 'purpose', 'activation_cost' then assign_array(column, value)
      else super(column, value)
      end
    end

    def assign_race_and_class(value)
      attributes[:race_and_class] << value unless attributes[:race_and_class].include?(value)
    end
  end
end
