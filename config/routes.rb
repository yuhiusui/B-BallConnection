Rails.application.routes.draw do
  devise_for :players, controllers:{
    registrations: 'players/registrations',
    sessions: 'players/sessions',
    passwords: 'players/passwords'
  }

  devise_for :admins, controllers:{
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  resources :players do
    resource :relations, only: [:create, :destroy]
    get 'follows' => 'relations#following', as: 'follows'
    get 'followers' => 'relations#followed', as: 'followers'
    get 'liked_courts' => 'likes#liked_courts'
  end
  resources :courts do
    resource :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    get 'liked_players' => 'likes#liked_players'
  end

  root 'homes#top'
  patch 'leave' => 'players#update_status'
  get 'leave' => 'players#leave'


  # namespace :public do
  #   get '' => 'players#show'
  #   get 'edit' => 'players#edit'
  #   patch '' => 'players#update'
  #   patch 'leave' => 'players#update_status'
  #   get 'leave' => 'players#leave'
  #   resources :players
  #   resources :courts
  #   resources :comments
  #   resources :favorites
  #   resources :relations
  # end
end