# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#index'
  resources :products
  resources :currencies
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    root 'products#index'
    resources :products
    resources :currencies do
      collection do
        post :upload
      end
    end
    post 'products/upload' => 'products#upload'
  end
end
