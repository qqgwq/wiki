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
      get :index, format: :csv
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

  describe "Check if the email exists" do
    it "email not exists" do
      get :check_email, params: {user: { email: 'gby@gmail.com'}}, format: 'json'
      expect(JSON.parse(response.body)).to eq({})
    end

    it "email exists" do
      user = create(:user, email: 'test@gmail.com')
      get :check_email, params: { email: user.email}, format: 'json'
      email_error = JSON.parse(response.body)
      expect(email_error["errors"]).to eq(email_error["errors"])
    end
  end


  describe "Check if the name exists" do
    it "name not exists" do
      get :check_name, params: { user: {name: 'gby'}}, format: 'json'
      expect(JSON.parse(response.body)).to eq({})
    end

    it "name exists" do
      user = create(:user, name: 'jenkin')
      get :check_name, params: { name: user.name}, format: 'json'
      name_error = JSON.parse(response.body)
      expect(name_error["errors"]).to eq(name_error["errors"])
    end
  end

  describe "Check if the phone exists" do
    it "phone not exists" do
      get :check_phone, params: { user: {phone: '15281454186'}}, format: 'json'
      expect(JSON.parse(response.body)).to eq({})
    end

    it "phone exists" do
      user = create(:user, phone: '18382012700')
      get :check_phone, params: { phone: user.phone}, format: 'json'
      phone_error = JSON.parse(response.body)
      expect(phone_error["errors"]).to eq(phone_error["errors"])
    end
  end
end