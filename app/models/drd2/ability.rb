# == Schema Information
#
# Table name: drd2_abilities
#
#  id              :bigint           not null, primary key
#  activation      :string
#  activation_cost :string           default([]), is an Array
#  class_advanced  :string
#  class_basic     :string
#  class_expert    :string
#  description     :text
#  drd2_attribute  :string
#  effect          :string           default([]), is an Array
#  level           :string
#  monster         :string
#  name            :string
#  purpose         :string           default([]), is an Array
#  race            :string
#  related_skill   :string           default([]), is an Array
#  rulebook        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Drd2::Ability < ApplicationRecord
  scope :sort_by_czech_name_asc, -> { sort { |a, b| Drd2::Ability.collator.compare(a.name, b.name) } }
  scope :sort_by_czech_name_desc, -> { sort { |a, b| Drd2::Ability.collator.compare(b.name, a.name) } }
  scope :sort_by_attribute_and_name_asc, lambda {
    sort do |a, b|
      [Drd2::Ability.collator.get_sort_key(a.drd2_attribute.first), Drd2::Ability.collator.get_sort_key(a.name)] <=>
        [Drd2::Ability.collator.get_sort_key(b.drd2_attribute.first), Drd2::Ability.collator.get_sort_key(b.name)]
    end
  }
  scope :sort_by_attribute_and_name_desc, lambda {
    sort do |a, b|
      [Drd2::Ability.collator.get_sort_key(b.drd2_attribute.first), Drd2::Ability.collator.get_sort_key(a.name)] <=>
        [Drd2::Ability.collator.get_sort_key(a.drd2_attribute.first), Drd2::Ability.collator.get_sort_key(b.name)]
    end
  }
end
