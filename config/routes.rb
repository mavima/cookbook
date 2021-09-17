Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   get '/users' => 'devise/registrations#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/about', to: 'pages#about'


  resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :favourites, only: [:create, :destroy]
  end

   # resources :favourites, only: :destroy

  get 'users/profile/:id', to: 'users#show', as: 'user'

end
