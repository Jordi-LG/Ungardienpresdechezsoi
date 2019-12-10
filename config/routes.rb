Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'staticpages#index'
  get 'team', to: 'staticpages#team'


  resources :charges

  devise_for :petsitters,  path: 'petsitters', controllers: { sessions: "petsitters/sessions", registrations: "petsitters/registrations", passwords: "petsitters/passwords"}
  devise_for :petowners, path: 'petowners', controllers: { sessions: "petowners/sessions", registrations: "petowners/registrations", passwords: "petowners/passwords"}
  resources :petsitters, only: [:show, :index] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :petowners, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :associations, only: [:show, :index]
  resources :petsittings, only: [:new, :create, :show, :update]
  resources :pets, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :comments, only: [:new, :create, :index]

end
