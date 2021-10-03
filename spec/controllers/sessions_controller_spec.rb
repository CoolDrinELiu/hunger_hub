require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe "Test requests" do
    context '#new' do
      before :each do
        get :new
      end
      it 'should render new template' do
        expect(response).to render_template("new")
      end

      it 'responds 200' do
        expect(response.status).to eq 200
      end
    end

    context '#create' do
      it 'should have the session user_id' do
        allow_any_instance_of(User).to receive(:authenticate).and_return(true)
        post :create, params: {name: user.name, password: "password"}
        expect(session[:user_id]).to be user.id
      end

      it 'should redirect to new_session_path with wrong password or name' do
        allow_any_instance_of(User).to receive(:authenticate).and_return(false)
        post :create, params: {name: user.name, password: "wrong-password"}
        expect(response).to redirect_to new_session_path
      end
    end

    context '#destroy' do
      it 'should clear the session user_id' do
        login_admin
        delete :destroy, params: {id: @user.id}
        expect(session[:user_id]).to be_nil
      end
    end
  end
end