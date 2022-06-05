class CreateDndItems < ActiveRecord::Migration[6.1]
  def change
    create_table :dnd_items do |t|
      t.string :title
      t.string :original
      t.string :rulebook, array: true, default: []
      t.string :rarity
      t.integer :filter_rarity, array: true, default: []
      t.string :attunement, array: true, default: []
      t.string :interaction
      t.string :purpose, array: true, default: []
      t.string :item, array: true, default: []
      t.string :combat_effect, array: true, default: []
      t.string :bonus, array: true, default: []
      t.string :limit, array: true, default: []
      t.string :duration
      t.integer :filter_duration
      t.text :description

      t.timestamps
    end
  end
end
