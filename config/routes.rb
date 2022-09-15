Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations'}
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   get '/users' => 'devise/registrations#destroy'
  end
  
  scope'(:locale)', locale: /en|fi/ do
    root to: 'pages#home'
    get '/about', to: 'pages#about'
  
  
    get '/recipes/recipe/:id/send_recipe', to: 'recipes#send_recipe', as: 'send_recipe'
    get 'users/profile/:id', to: 'users#show', as: 'user'

  

    resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
      resources :favourites, only: :create
      resources :reviews, only: [:new, :create, :edit, :update, :destroy]
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :links, only: [:index, :new, :create, :edit, :update] 
    resources :favourites, only: :destroy
    resources :links, only: :destroy

  
  end
  


end
