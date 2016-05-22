Rails.application.routes.draw do
  devise_for :admins

  resources :equipment
  resources :doctors

  root 'index#home'

  namespace :admin do
    resources :equipment
    resources :doctors
    resources :news
    resources :patients
  end

  get '/index/role_selection/:role', to: 'index#role_selection'
end
