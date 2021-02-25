Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  
get "u/:username" => "public#profile", as: :profile

  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#index"
  resources :subscriptions
  resources :comments, only: [:create]
end
