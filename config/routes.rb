Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: :create do
      get :followers, on: :member

      post 'follow/:id', to: 'users#follow'
      post 'unfollow/:id', to: 'users#unfollow'
    end
  end
end
