class Item < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }

  scope :items_by_category, ->(category_id) { joins(:category).where(category: { id: category_id }) }
end
