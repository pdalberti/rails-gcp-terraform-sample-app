class AddOriginalColumnsToSpell < ActiveRecord::Migration[6.1]
  def change
    add_column :spells, :original_casting, :string
    add_column :spells, :original_range, :string
    add_column :spells, :original_components, :string
    add_column :spells, :original_duration, :string
  end
end
