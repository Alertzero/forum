Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#index"
end
