# == Schema Information
#
# Table name: dnd_classes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DndClass < ApplicationRecord
  has_many :class_spells
  has_many :spells, through: :class_spells
end
