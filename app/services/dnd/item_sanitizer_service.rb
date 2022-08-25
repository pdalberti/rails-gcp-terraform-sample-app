module Dnd
  class ItemSanitizerService < ApplicationService
    def initialize(unsanitized_item)
      @element =   unsanitized_item
      @attributes = {}
      super()
    end

    def call
      super
      Dnd::Item.create!(attributes)
    end

    private

    def assign_column(column, value)
      case column
      when 'rarity'                           then assign_rarity(value)
      when 'duration'                         then assign_duration(value)
      when 'title', 'original', 'interaction' then super(column, value)
      when 'rulebook'                         then assign_uncapitalized_array(column, value)
      else assign_array(column, value)
      end
    end

    def assign_rarity(rarities)
      attributes[:rarity] = rarities
      attributes[:filter_rarity] = []
      rarities.split(', ').each do |rarity|
        attributes[:filter_rarity] << Dnd::Item::RARITY[rarity]
      end
    end

    def assign_duration(duration)
      attributes[:duration] = duration
      attributes[:filter_duration] = Dnd::Item::DURATION[duration]
    end
  end
end
