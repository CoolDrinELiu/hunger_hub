require 'rails_helper'
RSpec.describe FoodsController, type: :controller do
  describe "Foods request" do
    before :each do
      login_admin
    end

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

      it 'should include the records' do
        expect(assigns(:food).is_a?(Food)).to be true
      end
    end

    context '#create' do
      it 'should create a food' do
        file =  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/abc.png')))
        post :create, params: {food: {name: "Test", desc: "Desc", logo: file}}
        expect(Food.count).to eq 1
        expect(Food.first.name).to eq "Test"
      end

      it 'should redirect with an alert with missing with attributes' do
        post :create, params: {food: {name: "Test", desc: "Desc"}}
        expect(Food.count).to eq 0
      end
    end
  end
end