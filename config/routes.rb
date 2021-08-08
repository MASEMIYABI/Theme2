Rails.application.routes.draw do
   devise_for :users
   root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    end

  resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
  resources :book_comments,only: [:create,:destroy]
  end

  get 'home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get '/search', to: 'searches#search'
end