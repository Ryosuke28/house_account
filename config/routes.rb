Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    collection do
      get 'year'
      get 'month'
      get 'note'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
