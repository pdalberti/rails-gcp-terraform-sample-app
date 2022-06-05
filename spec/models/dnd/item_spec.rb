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
require 'rails_helper'

RSpec.describe Dnd::Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
