# == Schema Information
#
# Table name: fate_chapters
#
#  id               :bigint           not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fate_rulebook_id :bigint           not null
#
# Indexes
#
#  index_fate_chapters_on_fate_rulebook_id  (fate_rulebook_id)
#
# Foreign Keys
#
#  fk_rails_...  (fate_rulebook_id => fate_rulebooks.id)
#
module Fate
  class Chapter < ApplicationRecord
    belongs_to :fate_rulebook, class_name: 'Fate::Rulebook'
  end
end
