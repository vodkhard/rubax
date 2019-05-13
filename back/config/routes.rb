Rails.application.routes.draw do
  post '/auth/login' => 'user_token#create'
  resources :users, param: :_username

  resources :categories do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :upvotes
  end
end
