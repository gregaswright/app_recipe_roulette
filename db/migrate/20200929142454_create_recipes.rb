class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :ingredients 
    end
  end
end
