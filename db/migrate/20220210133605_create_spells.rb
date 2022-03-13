class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :school
      t.integer :level
      t.string :casting
      t.string :range
      t.string :components
      t.string :duration
      t.string :description
      t.boolean :ritual
      t.boolean :concentration

      t.timestamps
    end
  end
end
