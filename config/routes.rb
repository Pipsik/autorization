Rails.application.routes.draw do
  resources :achivements
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",:registrations => "users/registrations" }
  resources :users, :only => [:index, :destroy]
  root :to => 'sites#index'

  resources :sites

end

