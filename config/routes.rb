Rails.application.routes.draw do
  root to: 'posts#index'
  get 'posts/month', to: 'posts#month'
  get 'posts/year', to: 'posts#year'
  get 'posts/note', to: 'posts#note'
  devise_for :users
  resources :posts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
