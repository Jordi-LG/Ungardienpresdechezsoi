Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'staticpages#index'
  get 'team', to: 'staticpages#team'


  resources :charges

  devise_for :petsitters,  path: 'petsitters', controllers: { sessions: "petsitters/sessions", registrations: "petsitters/registrations", passwords: "petsitters/passwords"}
  devise_for :petowners, path: 'users', controllers: { sessions: "petowners/sessions", registrations: "petowners/registrations", passwords: "petowners/passwords"}
  resources :petsitters, only: [:show, :index] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :petowners, only: [:show], path: 'profil' do
    resources :avatars, only: [:create]
  end

  resources :pets, only: [:new, :create] do
    resources :avatars, only: [:create]
  end
  resources :organizations, only: [:show, :index, :new, :create], :path => "associations"
  resources :associations, only: [:show, :index, :new, :create]
  resources :petsittings, only: [:new, :create, :show, :update, :destroy]
  resources :contacts, only: [:new, :create]
  resources :comments, only: [:new, :create, :index]

end
