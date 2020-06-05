Rails.application.routes.draw do
  devise_for :players, path: "public/players", controllers:{
    registrations: 'players/registrations',
    sessions: 'players/sessions',
    passwords: 'players/passwords'
}

  devise_for :admins, controllers:{
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
}

  namespace :public do
    get '' => 'players#show'
    get 'edit' => 'players#edit'
    patch '' => 'players#update'
    patch 'leave' => 'players#update_status'
    get 'leave' => 'players#leave'
    resources :players
    resources :courts
    resources :comments
    resources :favorites
    resources :relations
  end
  root 'public/homes#top'
end