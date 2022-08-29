module Drd2
  class AbilitySanitizerService < ApplicationService
    def initialize(unsanitized_ability)
      @element =    unsanitized_ability
      @attributes = { origin: [] }
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
      assign_origin(value) if Drd2::Ability::RACE_AND_CLASS.include?(column) && value.present?

      case column
      when 'related_skill', 'effect', 'purpose', 'activation_cost' then assign_array(column, value)
      else super(column, value)
      end
    end

    def assign_origin(value)
      attributes[:origin] << value unless attributes[:origin].include?(value)
    end
  end
end
