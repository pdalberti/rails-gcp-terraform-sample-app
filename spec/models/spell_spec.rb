# == Schema Information
#
# Table name: spells
#
#  id            :bigint           not null, primary key
#  casting       :integer
#  components    :string
#  concentration :boolean
#  description   :string
#  duration      :integer
#  en_name       :string
#  level         :integer
#  name          :string
#  range         :integer
#  ritual        :boolean
#  rulebook      :string
#  school        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Spell, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
