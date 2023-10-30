Rails.application.routes.draw do
  devise_for :users
  resources :subscriptions, only: [:create, :show]
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
end
