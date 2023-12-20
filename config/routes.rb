Rails.application.routes.draw do
  devise_for :users
  resources :subscriptions, only: [:create, :show]
  resources :profiles do 
    resources :posts
  end
  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  namespace :admin do
    resources :profiles do 
      resources :posts, except: :show
    end
    resources :posts
    resources :subscriptions
    root "admin/pins#index"
  end
  namespace :api do
    namespace :v1 do
      resources :profiles
      resources :posts
    end
    end
end
