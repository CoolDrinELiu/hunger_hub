require 'rails_helper'
RSpec.describe SubscriptionsController, type: :controller do
  let!(:food) { create(:food) }
  before do
    login_admin
    @user.folk!
  end

  describe "Test requests" do
    context '#new and #get_form' do
      it 'should render new template' do
        get :get_form, xhr: true, params: {food_id: food.id}
        expect(response).to render_template("get_form")
      end

      it 'responds 200' do
        get :get_form, xhr: true, params: {food_id: food.id}
        expect(response.status).to eq 200
      end
    end

    context '#create' do
      it 'should have the notice message when success' do
        post :create, params: {subscription: {food_id: food.id, qty: 20}}
        expect(flash[:notice]).to eq "Success!"
      end

      it 'should have the alert message when failed' do
        post :create, params: {subscription: {wrong_key: food.id}}
        expect(flash[:alert]).to eq "Failed."
      end
    end
  end
end