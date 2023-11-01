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
  resources :tickets
  resources :organizers
  resources :attenders

  get "/show", to: "events#show"
  get "/edit", to: "events#edit"
  get "/destroy", to: "events#destroy"

  get "/show", to: "tickets#show"
  get "/edit", to: "tickets#edit"
  get "/destroy", to: "tickets#destroy"

  get "/attenders/show", to: "attenders#show"
  get "/tickets/show", to: "tickets#show"
  get "/book", to: "tickets#book"
  get "/organizers/index", to: "organizers#index"
  get "/attenders/index", to: "attenders#index"
  
end



 

