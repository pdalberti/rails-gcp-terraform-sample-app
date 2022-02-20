class ChangeColumnsToEnum < ActiveRecord::Migration[6.1]
  def change
    change_table :spells do |t|
      t.remove :casting
      t.remove :range
      t.remove :duration

      t.integer :casting
      t.integer :range
      t.integer :duration
    end
  end
end
