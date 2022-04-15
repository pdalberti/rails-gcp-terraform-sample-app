class CreateFateTricks < ActiveRecord::Migration[6.1]
  def change
    create_table :fate_tricks do |t|
      t.string :actions, array: true, default: []
      t.string :costs, array: true, default: []
      t.string :dials, array: true, default: []
      t.string :fae_approach, array: true, default: []
      t.string :fc_extra, array: true, default: []
      t.string :fc_skill, array: true, default: []
      t.string :origin
      t.string :original
      t.string :restrictions, array: true, default: []
      t.string :source
      t.string :sw_archetype, array: true, default: []
      t.string :sw_enemy, array: true, default: []
      t.string :sw_extra, array: true, default: []
      t.string :sw_race, array: true, default: []
      t.string :sw_skill, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :title
      t.string :trick_type, array: true, default: []
      t.text :description

      t.timestamps
    end
  end
end
