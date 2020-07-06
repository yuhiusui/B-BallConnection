Rails.application.routes.draw do
  devise_for :players, controllers: {
    registrations: 'players/registrations',
    sessions: 'players/sessions',
    passwords: 'players/passwords',
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
  }

  resources :players do
    resource :relations, only: [:create, :destroy]
    delete 'admin_destroy' => 'players#admin_destroy'
    get 'follows' => 'relations#following', as: 'follows'
    get 'followers' => 'relations#followed', as: 'followers'
    get 'liked_courts' => 'likes#liked_courts'
  end

  resources :courts do
    resource :reviews, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    get 'review' => 'reviews#review'
    get 'comment' => 'comments#comment'
    get 'liked_players' => 'likes#liked_players'
  end

  root 'homes#top'
  get 'to_admin' => 'homes#to_admin'
  get 'leave' => 'players#leave'
  patch 'leave' => 'players#update_status'
  get 'get_checked_comment' => 'natural_language_api#get_checked_comment'
end
