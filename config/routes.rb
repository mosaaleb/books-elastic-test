# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout' }

  authenticated :user do
    root 'feed#index', as: :authenticated_user
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end
end
