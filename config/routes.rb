Rails.application.routes.draw do
  root 'posts#index'
  resources :tags

  resources :posts do
    resources :comments
  end
end
