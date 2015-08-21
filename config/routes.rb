Rails.application.routes.draw do
  root 'posts#index'
  delete "/remove", to: "posts#remove_image"
  resources :tags

  resources :posts do
    resources :comments
  end
end
