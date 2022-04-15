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
    STRING_COLUMNS = %i[origin original source title].freeze
  end
end
