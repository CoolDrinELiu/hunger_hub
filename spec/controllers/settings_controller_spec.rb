require 'rails_helper'
RSpec.describe SettingsController, type: :controller do
  let(:setting) { create(:setting) }

  before do
    login_admin
  end

  describe "Test requests" do
    context '#new and #edit' do
      it 'should render new template' do
        get :new
        expect(response).to render_template("new")
      end

      it 'responds 200' do
        get :new
        expect(response.status).to eq 200
      end

      it 'should render the edit template' do
        get :edit, params: {id: setting.id}
        expect(response).to render_template("edit")
      end

      it 'responds 200' do
        get :edit, params: {id: setting.id}
        expect(response.status).to eq 200
      end
    end

    context '#create' do
      it 'should have the setting record' do
        post :create, params: {setting: {cut_off_at: "2020-01-01 11:22:44"}}
        expect(Setting.count).to be 1
      end

      it 'should render new template when cut off time is already set' do
        setting
        post :create, params: {setting: {name: @user.name, password: "wrong-password"}}
        expect(response).to render_template("new")
        expect(Setting.count).to eq 1
      end
    end

    context '#update' do
      it 'should update the record' do
        put :update, params: {id: setting.id, setting: {cut_off_at: "2030-03-03 12:00:00"}}
        expect(setting.reload.cut_off_at.strftime("%Y-%m-%d %H:%M:%S")).to eq "2030-03-03 12:00:00"
      end
    end
  end
end