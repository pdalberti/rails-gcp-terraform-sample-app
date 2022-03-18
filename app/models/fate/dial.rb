# == Schema Information
#
# Table name: fate_dials
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  fate_chapter_id :bigint           not null
#  fate_trick_id   :bigint           not null
#
# Indexes
#
#  index_fate_dials_on_fate_chapter_id  (fate_chapter_id)
#  index_fate_dials_on_fate_trick_id    (fate_trick_id)
#
# Foreign Keys
#
#  fk_rails_...  (fate_chapter_id => fate_chapters.id)
#  fk_rails_...  (fate_trick_id => fate_tricks.id)
#
module Fate
  class Dial < ApplicationRecord
    belongs_to :fate_chapter, class_name: 'Fate::Chapter'
    belongs_to :fate_trick, class_name: 'Fate::Trick'
  end
end
