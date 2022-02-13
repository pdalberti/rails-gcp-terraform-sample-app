# == Schema Information
#
# Table name: class_spells
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dnd_class_id :bigint           not null
#  spell_id     :bigint           not null
#
# Indexes
#
#  index_class_spells_on_dnd_class_id  (dnd_class_id)
#  index_class_spells_on_spell_id      (spell_id)
#
# Foreign Keys
#
#  fk_rails_...  (dnd_class_id => dnd_classes.id)
#  fk_rails_...  (spell_id => spells.id)
#
class ClassSpell < ApplicationRecord
  belongs_to :spell
  belongs_to :dnd_class
end
