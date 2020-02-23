# frozen_string_literal: true

Rails.application.routes.draw do
  get 'shelves/show'
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

  resources :authors, only: %i[index show], param: :name do
    member do
      post 'follow', to: 'followships#create'
      delete 'unfollow', to: 'followships#destroy'
    end
  end

  resources :books, only: %i[index show new create] do
    member do
      post 'add', to: 'book_additions#create'
      delete 'remove', to: 'book_additions#destroy'
    end
  end
  resources :users, only: %i[index show], path: '', param: :username do
    resource :shelf, only: %i[show]
  end
end
