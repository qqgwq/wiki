require 'rails_helper'
require 'pry'
RSpec.describe UsersController, type: :controller do
  include TestHelper
  describe "GET new" do
    subject(:user) { User.new }
    it "a new @user" do
      get :new
      expect(user).to be_a_new(User)
    end
  end

  describe "GET index" do
    subject(:@users) { User.all }
    it "all users" do
      get :index
      expect(@users).to eq(@users)
    end
  end

  describe "GET show" do
    it "show user" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response.status).to eq(200)
    end
  end

  describe "POST create" do
    it "create user" do
      post :create, params: { user: attributes_for(:user) }
      login?
      expect(response.content_type).to eq "text/html"
    end
  end

  describe "POST create failure" do
    it "create user failure" do
      post :create, params: { user: {} }
      expect(User.count).to eq(0)
    end
  end

  describe "GET edit" do
    it "Edit user" do
      user = create(:user)
      get :edit, params: { id: user }
      login_as user
      expect(response.status).to eq(200)
    end
  end

  describe 'GET person' do
    it "person sources" do
      user = create(:user)
      get :person, params: { id: user }
      login_as user
      expect(response.status).to eq(200)
    end
  end

  describe 'GET profile' do
    it "user articles and integral" do
      user = create(:user)
      get :profile, params: { id: user }
      login_as user
      expect(response.status).to eq(200)
    end
  end

  describe 'Update user' do
    it "update user" do
      user = create(:user)
      login_as user
      patch :update, params: { id: user.id, user: user.attributes }
      user.reload
      expect(response).to redirect_to user
    end
  end

  describe "Delete user" do
    it "delete user" do
      user = create(:user)
      login_as user
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to root_path
    end
  end

  describe "Post get sms code" do
    it "Get sms code" do
      post :get_sms_code
      expect(response.content_type).to eq("text/html")
    end
  end

  describe "Random sms code" do
    it "random 6 sms code" do
      expect(controller.sms_code.to_s).to match(/^\d{6}$/)
    end
  end
end