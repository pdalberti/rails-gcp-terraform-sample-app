class CreateFateTricks < ActiveRecord::Migration[6.1]
  def change
    create_table :fate_tricks do |t|
      t.string :name
      t.string :en_name
      t.string :trick_type
      t.string :tag
      t.string :restriction
      t.integer :fate
      t.string :action
      t.text :description
      t.references :fate_rulebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
