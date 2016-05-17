require 'rails_helper'
require 'devise'

RSpec.describe ItemsController, type: :controller do
  context "user" do
    before do
      @user = FactoryGirl.create(:user, id: 1)
      @item = FactoryGirl.create(:item, user: @user)
      sign_in :user, @user
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {user_id: @user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "create item" do
      it "creates a user item" do
        expect{post :create, user_id: @user.id, item: {user_id: @user.id, name: "MyString"}}.to change(@user.items,:count).by(1)
        expect(response).to redirect_to(user_path(@user.id))
      end
    end

    describe "destroy item" do
      it "destroys an item" do
        delete :destroy, format: :js, user_id: @user.id, id: @item.id
        count = Item.where({id: @item.id}).size
        expect(count).to eq 0
        expect(response).to have_http_status(:success)
      end
    end
  end
end
