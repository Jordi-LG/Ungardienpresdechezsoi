Rails.application.routes.draw do
  root to: 'staticpages#index'
  get 'team', to: 'staticpages#team'
  get 'contact', to: 'staticpages#contact'



  devise_for :petsitters,  path: 'petsitters', controllers: { registrations: "petsitters/registrations"}
  devise_for :petowners
  resources :petsitters, only: [:show, :index] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :petowners, only: [:show] do
  end
  resources :associations, only: [:show]
  resources :petsittings, only: [:new, :create, :show]
end
