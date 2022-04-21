class AddCategoryToItem < ActiveRecord::Migration[6.1]
  def change
    add_reference(:items, :category, foreign_key: { to_table: :categories })
  end
end
