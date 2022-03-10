class ChangeColumnsToEnum < ActiveRecord::Migration[6.1]
  def change
    change_table :spells do |t|
      t.remove :casting, type: :string
      t.remove :range, type: :string
      t.remove :duration, type: :string

      t.integer :casting
      t.integer :range
      t.integer :duration
    end
  end
end
