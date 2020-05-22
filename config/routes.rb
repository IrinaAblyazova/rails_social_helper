# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
  end
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      resource :sessions, only: %i[new create destroy]
      root to: 'companies#index'
      resources :users, :companies, :districts do
        put 'restore'
        put 'del'
      end
      resources :tasks do
        put 'restore'
        put 'del'
        put 'process'
        put 'complete'
      end
      resources :admins
      resources :districts, only: %i[index new create edit update destroy]
      resources :services, only: %i[index new create edit update destroy]
    end

    namespace :user do
      resource :profile, only: %i[edit update]
      resource :sessions, only: %i[new create destroy]
    end
  end
end
