Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: %i[index show]
  resources :categories, only: :show

  root to: "items#index"

  namespace :admin do
    root to: "items#index"
    resources :items
    resources :categories
  end
end
