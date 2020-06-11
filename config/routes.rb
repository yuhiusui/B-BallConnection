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

  root 'homes#top'
  patch 'leave' => 'players#update_status'
  get 'leave' => 'players#leave'
  resources :players do
    resource :relations, only: [:create, :destroy]
    get 'follows' => 'relations#following', as: 'follows'
    get 'followers' => 'relations#followed', as: 'followers'
  end
  resources :courts do
    resource :comments
    resource :favorites
  end
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