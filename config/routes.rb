Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :bloggers
  resources :destinations
  resources :posts
  post '/posts/:id/like', to: 'posts#like'
end
