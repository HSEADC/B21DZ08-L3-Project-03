Rails.application.routes.draw do
  resources :posts
  resources :profiles do
    resources :posts
  end
  resources :users


  get 'welcome/index'
  get 'welcome/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
