class AddOriginalColumnsToSpell < ActiveRecord::Migration[6.1]
  def change
    add_column :spells, :original_casting, :string
    add_column :spells, :original_range, :string
    add_column :spells, :original_components, :string
    add_column :spells, :original_duration, :string
    remove_column :spells, :name, :string
    remove_column :spells, :en_name, :string
    add_column :spells, :title, :string
    add_column :spells, :original, :string
  end
end
