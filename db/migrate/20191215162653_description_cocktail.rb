class DescriptionCocktail < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :description
      t.timestamps
    end
  end
end
