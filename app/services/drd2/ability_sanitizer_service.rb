module Drd2
  class AbilitySanitizerService < ApplicationService
    def initialize(unsanitized_ability)
      @element =   unsanitized_ability
      @attributes = {}
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
      case column
      when 'related_skill', 'effect', 'purpose', 'activation_cost' then assign_array(column, value)
      else super(column, value)
      end
    end
  end
end
