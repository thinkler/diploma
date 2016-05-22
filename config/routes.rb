Rails.application.routes.draw do
  devise_for :admins
  devise_for :patients

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
  post '/patients', to: 'patients#sign_in', as: 'patient_sign_in'
  delete '/patients', to: 'patients#sign_out', as: 'patient_sign_out'
end
