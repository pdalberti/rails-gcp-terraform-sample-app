# == Schema Information
#
# Table name: fate_tricks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module Fate
  class Trick < ApplicationRecord
    belongs_to :fate_rulebook, class_name: 'Fate::Rulebook'
    has_many :fate_dials, foreign_key: 'fate_trick_id', class_name: 'Fate::Dial'
    has_many :fate_chapters, through: :fate_dials, class_name: 'Fate::Chapter'
  end
end
