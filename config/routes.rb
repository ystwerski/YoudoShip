Rails.application.routes.draw do
  devise_for :users
  get '/' => 'general_infos#index'
  get '/home' => 'general_infos#index'
  get '/general_infos' => 'general_infos#index'
  get '/sending_shipments/new' => 'sending_shipments#new', :as => :new_sending_shipment
  post '/sending_shipments' => 'sending_shipments#create', :as => :sending_shipment
  patch '/sending_shipments/:id' => 'sending_shipments#update', :as => :updating_shipment
  get '/takers' => 'takers#index', :as => :takers
  get '/takers/new' => 'takers#new', :as => :new_taker
  post '/takers' => 'takers#create', :as => :informing_taker
  get '/takers/:id' => 'takers#show'

  resources :talk_to_senders
  # resources :sending_shipments
  # resources :taking_shipments
  resources :view_general_packages
  
end
