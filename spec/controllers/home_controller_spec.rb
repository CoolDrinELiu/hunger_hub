require 'rails_helper'
RSpec.describe HomeController, type: :controller do
  let!(:food) { create(:food) }

  describe "request" do
    context 'with logging in' do
      before :each do
        login_admin
        get :index
      end
      it 'should render new template' do
        expect(response).to render_template("index")
      end

      it 'responds 200' do
        expect(response.status).to eq 200
      end

      it 'should include the records' do
        expect(assigns(:records)).to include food
      end
    end

    context 'without logging in' do
      before :each do
        get :index
      end
      it 'should render new template' do
        expect(response).to render_template("index")
      end

      it 'responds 200' do
        expect(response.status).to eq 200
      end

      it 'should include the records' do
        expect(assigns(:records)).to include food
      end
    end
  end
end