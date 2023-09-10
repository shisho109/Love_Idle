Rails.application.routes.draw do
  get 'rooms/show'
  get 'videos/top' => 'videos#top'
  devise_for :users
  resources :users, only: [:show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :videos do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :photos do
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  resources :events do
    resources :captures, only: [:create, :destroy]
    resources :opinions, only: [:create]
  end
  root 'videos#top'
end