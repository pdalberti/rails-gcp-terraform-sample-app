# == Schema Information
#
# Table name: spells
#
#  id            :bigint           not null, primary key
#  casting       :string
#  components    :string
#  concentration :boolean
#  description   :string
#  duration      :string
#  level         :integer
#  name          :string
#  range         :string
#  ritual        :boolean
#  school        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Spell < ApplicationRecord
end
