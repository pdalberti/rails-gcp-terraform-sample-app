class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :en_name
      t.string :school
      t.integer :level
      t.integer :casting
      t.integer :range
      t.string :components
      t.integer :duration
      t.string :description
      t.boolean :ritual
      t.boolean :concentration
      t.string :rulebook

      t.timestamps
    end
  end
end
