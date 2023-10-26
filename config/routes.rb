Rails.application.routes.draw do
  get 'events/show'
  get 'events/edit'
  get 'events/destroy'
  get 'events/update'
  get 'events/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
   end

   
  root "home#index"
  get 'home', to: "home#index"
  resource "home"
  resources :events

  get "/show", to: "events#show"
  get "/edit", to: "events#edit"
  get "/destroy", to: "events#destroy"

  get "/attenders/show", to: "attenders#show"
  
  # resources :users
  # resources :organizers
  # get 'attender_dashboard', to: "attenders#dashboard"
  # get 'organizer_dashboard', to: "organizers#index"
  
end



 

