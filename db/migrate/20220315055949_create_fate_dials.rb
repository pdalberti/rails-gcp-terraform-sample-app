class CreateFateDials < ActiveRecord::Migration[6.1]
  def change
    create_table :fate_dials do |t|
      t.references :fate_chapter, null: false, foreign_key: true
      t.references :fate_trick, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
