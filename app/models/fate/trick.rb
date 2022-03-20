# == Schema Information
#
# Table name: fate_tricks
#
#  id               :bigint           not null, primary key
#  action           :string
#  description      :text
#  en_name          :string
#  fate             :integer
#  name             :string
#  restriction      :string
#  tag              :string
#  trick_type       :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fate_rulebook_id :bigint           not null
#
# Indexes
#
#  index_fate_tricks_on_fate_rulebook_id  (fate_rulebook_id)
#
# Foreign Keys
#
#  fk_rails_...  (fate_rulebook_id => fate_rulebooks.id)
#
module Fate
  class Trick < ApplicationRecord
    belongs_to :fate_rulebook, class_name: 'Fate::Rulebook'
    has_many :fate_dials, foreign_key: 'fate_trick_id', class_name: 'Fate::Dial'
    has_many :fate_chapters, through: :fate_dials, class_name: 'Fate::Chapter'
  end
end
