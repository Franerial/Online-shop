require "rails_helper"

RSpec.describe ItemsController, type: :controller do
  let(:item) { create(:item) }

  describe "GET #index" do
    let(:items) { create_list(:item, 3) }

    before { get :index }

    it "populate an array of all items" do
      expect(assigns(:items)).to match_array(items)
    end

    it "render index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: item } }

    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq item
    end

    it "renders show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before { get :new }

    it "assigns a new item to @item" do
      expect(assigns(:item)).to be_a_new(Item)
    end

    it "renders new view" do
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: item } }

    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq item
    end

    it "renders edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves a new item into database" do
        expect { post :create, params: { item: attributes_for(:item) } }.to change(Item, :count).by(1)
      end

      it "redirect to show view" do
        post :create, params: { item: attributes_for(:item) }
        expect(response).to redirect_to assigns(:item)
      end
    end

    context "with invalid attributes" do
      it "doesn't save item" do
        expect { post :create, params: { item: attributes_for(:item, :invalid) } }.to_not change(Item, :count)
      end

      it "re-render new form" do
        post :create, params: { item: attributes_for(:item, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "assigns the requested item to @item" do
        patch :update, params: { id: item, item: attributes_for(:item) }
        expect(assigns(:item)).to eq item
      end

      it "changes item attributes" do
        patch :update, params: { id: item, item: { title: "new title", description: "new description" } }
        item.reload

        expect(item.title).to eq "new title"
        expect(item.description).to eq "new description"
      end

      it "redirects to updated item" do
        patch :update, params: { id: item, item: attributes_for(:item) }
        expect(response).to redirect_to item
      end
    end

    context "with invalid attributes" do
      before { patch :update, params: { id: item, item: attributes_for(:item, :invalid) } }

      it "does not change item" do
        item.reload

        expect(item.title).to eq "MyString"
        expect(item.description).to eq "MyText"
      end

      it "re-renders edit view" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:item) { create(:item) }

    it "deletes the item" do
      expect { delete :destroy, params: { id: item } }.to change(Item, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, params: { id: item }
      expect(response).to redirect_to items_path
    end
  end
end
