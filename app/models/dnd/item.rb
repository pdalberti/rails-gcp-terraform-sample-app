# == Schema Information
#
# Table name: dnd_items
#
#  id              :bigint           not null, primary key
#  attunement      :string           default([]), is an Array
#  bonus           :string           default([]), is an Array
#  combat_effect   :string           default([]), is an Array
#  description     :text
#  duration        :string
#  filter_duration :integer
#  filter_rarity   :integer          default([]), is an Array
#  interaction     :string
#  item            :string           default([]), is an Array
#  limit           :string           default([]), is an Array
#  original        :string
#  purpose         :string           default([]), is an Array
#  rarity          :string
#  rulebook        :string           default([]), is an Array
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module Dnd
  class Item < ApplicationRecord
    DURATION = {
      'Ihned' => 0,
      '1 kolo' => 1,
      'X kol' => 2,
      '1 minuta' => 3,
      '5 minut' => 4,
      '10 minut' => 5,
      'X minut' => 6,
      '1 hodina' => 7,
      '2 hodiny' => 8,
      '4 hodiny' => 9,
      '6 hodin' => 10,
      '8 hodin' => 11,
      'X hodin' => 12,
      'X dní' => 13,
      'Do rozptýlení' => 14,
      'Permanentní' => 15,
      'Zvláštní' => 16,
      'nepovinný' => 17
    }.freeze

    RARITY = {
      'Běžný' => 0,
      'Neobvyklý' => 1,
      'Vzácný' => 2,
      'Velmi vzácný' => 3,
      'Legendární' => 4,
      'Artefakt' => 5
    }.freeze
  end
end
