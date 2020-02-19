# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login',
                                             sign_up: 'register',
                                             sign_out: 'logout' }

  authenticated :user do
    root 'feed#index', as: :authenticated_user
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :authors, only: %i[index show], param: :name
  resources :books, only: %i[index show new create] do
    member do
      post 'add', to: 'book_additions#create'
    end
    member do
      delete 'remove', to: 'book_additions#destroy'
    end
  end
  resources :users, only: %i[index show], path: '', param: :username
end
