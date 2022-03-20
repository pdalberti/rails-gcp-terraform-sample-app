class CreateFateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :fate_chapters do |t|
      t.string :name
      t.references :fate_rulebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
