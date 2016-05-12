require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user = User1.create(:user)
    @user2 = User2.create(:user)
    @admin = Admin.create(:admin)
  end

  describe "GET #show"
    context "User is logged in" do
      it "displays correct user" do
        sign_in @user
        get :show, id: @user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

      it "cannot display different user" do
        sign_in @user
        get :show, id: @user2.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "User is not logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to("/users/sign_in")
      end
    end

end