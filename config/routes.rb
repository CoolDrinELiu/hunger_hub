Rails.application.routes.draw do
  require 'sidekiq/web'
  require "sidekiq-scheduler/web"

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_USER'] && password == ENV['SIDEKIQ_PWD']
  end
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :foods, only: [:new, :destroy, :create] do
    member do
      get :get_form
    end
  end
end
