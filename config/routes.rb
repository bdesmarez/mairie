Mailing::Application.routes.draw do
  # mount Mercury::Engine => '/'
  # Mercury::Engine.routes
  resources :mailing_schedules
  match "mailing_schedules/preview/:id" => "mailing_schedules#preview", :via => :get, :as => :mailing_preview

  resources :templates
  match "templates/preview/:id" => "templates#preview", :via => :get, :as => :template_preview

  resources :city_halls

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end