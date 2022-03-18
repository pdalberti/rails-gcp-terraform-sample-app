class CreateFateRulebooks < ActiveRecord::Migration[6.1]
  def change
    create_table :fate_rulebooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
