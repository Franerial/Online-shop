require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category_with_items, items_count: 5) }

  describe "GET #show" do
    before { get :show, params: { id: category } }

    it "assigns the requested category to @category" do
      expect(assigns(:category)).to eq category
    end

    it "assigns the requested items to @items" do
      expect(assigns(:items)).to eq category.items
    end
  end
end
