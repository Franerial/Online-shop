class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, scale: 2, precision: 8, null: false

      t.timestamps
    end
  end
end
