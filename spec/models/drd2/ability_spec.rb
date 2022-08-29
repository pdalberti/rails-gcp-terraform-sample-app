# == Schema Information
#
# Table name: drd2_abilities
#
#  id              :bigint           not null, primary key
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
#  origin          :string           default([]), is an Array
#  purpose         :string           default([]), is an Array
#  race            :string
#  related_skill   :string           default([]), is an Array
#  rulebook        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Drd2::Ability, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
