class CreateClassSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :class_spells do |t|
      t.references :spell, null: false, foreign_key: true
      t.references :dnd_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
