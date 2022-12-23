Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  resources :posts do
    resources :comments
  end
  root to: "home#index"
end