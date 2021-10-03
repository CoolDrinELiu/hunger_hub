require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  describe "Test requests" do
    context '#new' do
      it 'should render new template' do
        get :new
        expect(response).to render_template("new")
      end

      it 'responds 200' do
        get :new
        expect(response.status).to eq 200
      end
    end

    context '#create' do
      it 'should have an user record' do
        post :create, params: {user: {name: "123", password: "123123123"}}
        expect(User.count).to eq 1
      end

      it 'should redirect with missing attributes' do
        post :create, params: {user: {name: "123"}}
        expect(response).to redirect_to new_user_path
      end
    end
  end
end