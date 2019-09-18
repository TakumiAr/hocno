Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
  registrations:'users/registrations',
  sessions: 'users/sessions'
  }

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :posts do
    resources :comments
  end
  get 'search', to: 'posts#search'
  resources :users do
    collection do
      get 'listing'
      get 'like'
      get 'thinking'
      get 'purchase'
      get 'notification'
      get 'abandonment'
      get 'close_account'
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :notices, only: :index
  root 'posts#index'
end
