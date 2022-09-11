# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create destroy edit update]
  resources :projects, only: %i[new create destroy edit update]
  resources :archives

  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end

  root 'pages#index'
  get 'session' => 'sessions#destroy'

  resources :questions do
    post :start_working, on: :member
    post :completed_working, on: :member
    post :send_to_archive, on: :member
    post :back_to_active, on: :member
    get :back_to_active, on: :member
  end
end
