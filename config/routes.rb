Mailing::Application.routes.draw do
  # mount Mercury::Engine => '/'
  # Mercury::Engine.routes
  resources :mailing_schedules

  resources :templates
  match "templates/preview/:id" => "templates#preview", :via => :get, :as => :template_preview

  resources :city_halls

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end