Rails.application.routes.draw do
  get 'recent/add/:id', to: 'recents#add', as: "recent_add"
  get 'feeds/index'
  post 'support/request_support'
  devise_for :users
  resources :subscriptions, only: [:create, :show]
  resources :employment_opportunities

  resources :posts
  resources :profiles 
  get 'feed', to: 'feeds#index'
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/employment_opportunity'
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
      devise_scope :user do
        post "sign_in", to: "sessions#create"
      end
      resources :profiles
      resources :posts
      resources :employment_opportunities
    end
    end
end
