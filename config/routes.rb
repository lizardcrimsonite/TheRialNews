Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  devise_for :users
  root 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
