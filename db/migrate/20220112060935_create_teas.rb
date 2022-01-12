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
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
