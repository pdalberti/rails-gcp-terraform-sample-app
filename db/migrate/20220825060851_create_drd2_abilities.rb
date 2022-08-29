class CreateDrd2Abilities < ActiveRecord::Migration[6.1]
  def change
    create_table :drd2_abilities do |t|
      t.string :name
      t.string :rulebook
      t.string :level
      t.string :drd2_attribute
      t.string :related_skill, array: true, default: []
      t.string :effect, array: true, default: []
      t.string :purpose, array: true, default: []
      t.string :activation_cost, array: true, default: []
      t.string :class_basic
      t.string :class_advanced
      t.string :class_expert
      t.string :race
      t.string :monster
      t.string :race_and_class, array: true, default: []
      t.text :description

      t.timestamps
    end
  end
end
