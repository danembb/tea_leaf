class CreateTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :keywords
      t.string :origin
      t.integer :brew_time
      t.float :temperature

      t.timestamps
    end
  end
end
