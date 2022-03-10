# == Schema Information
#
# Table name: sources
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rulebook_id :bigint           not null
#  spell_id    :bigint           not null
#
# Indexes
#
#  index_sources_on_rulebook_id  (rulebook_id)
#  index_sources_on_spell_id     (spell_id)
#
# Foreign Keys
#
#  fk_rails_...  (rulebook_id => rulebooks.id)
#  fk_rails_...  (spell_id => spells.id)
#
class Source < ApplicationRecord
  belongs_to :spell
  belongs_to :rulebook
end
