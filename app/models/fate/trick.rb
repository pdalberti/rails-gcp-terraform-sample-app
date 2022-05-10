# == Schema Information
#
# Table name: fate_tricks
#
#  id           :bigint           not null, primary key
#  actions      :string           default([]), is an Array
#  costs        :string           default([]), is an Array
#  description  :text
#  dials        :string           default([]), is an Array
#  fae_approach :string           default([]), is an Array
#  fc_extra     :string           default([]), is an Array
#  fc_skill     :string           default([]), is an Array
#  origin       :string
#  original     :string
#  restrictions :string           default([]), is an Array
#  source       :string
#  sw_archetype :string           default([]), is an Array
#  sw_enemy     :string           default([]), is an Array
#  sw_extra     :string           default([]), is an Array
#  sw_race      :string           default([]), is an Array
#  sw_skill     :string           default([]), is an Array
#  tags         :string           default([]), is an Array
#  title        :string
#  trick_type   :string           default([]), is an Array
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
module Fate
  class Trick < ApplicationRecord
    scope :sort_by_czech_title_asc, -> { sort { |a, b| Fate::Trick.collator.compare(a.title, b.title) } }
    scope :sort_by_czech_title_desc, -> { sort { |a, b| Fate::Trick.collator.compare(b.title, a.title) } }
    scope :sort_by_dial_and_title_asc, lambda {
      sort do |a, b|
        [Fate::Trick.collator.get_sort_key(a.dials.first), Fate::Trick.collator.get_sort_key(a.title)] <=>
          [Fate::Trick.collator.get_sort_key(b.dials.first), Fate::Trick.collator.get_sort_key(b.title)]
      end
    }
    scope :sort_by_dial_and_title_desc, lambda {
      sort do |a, b|
        [Fate::Trick.collator.get_sort_key(b.dials.first), Fate::Trick.collator.get_sort_key(a.title)] <=>
          [Fate::Trick.collator.get_sort_key(a.dials.first), Fate::Trick.collator.get_sort_key(b.title)]
      end
    }

    STRING_COLUMNS = %i[origin original source title].freeze
  end
end
