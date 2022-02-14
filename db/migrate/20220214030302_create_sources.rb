class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.references :spell, null: false, foreign_key: true
      t.references :rulebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
