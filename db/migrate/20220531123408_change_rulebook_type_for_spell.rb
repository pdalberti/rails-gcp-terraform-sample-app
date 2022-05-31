class ChangeRulebookTypeForSpell < ActiveRecord::Migration[6.1]
  def change
    remove_column :spells, :rulebook, :string
    add_column :spells, :rulebook, :string, array: true, default: []
  end
end
