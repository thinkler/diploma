Rails.application.routes.draw do
  devise_for :admins
  devise_for :doctors

  resources :equipment
  resources :doctors

  root 'index#home'

  namespace :admin do
    resources :equipment
    resources :doctors
    resources :news
    resources :patients
  end

  namespace :patient do
    resources :notes
    resources :tickets
    get '/search/:klass/:q', to: 'tickets#search'
    get '/select/:klass/:id', to: 'tickets#select_resource'
  end

  get 'patient/personal_info', to: 'patients#personal_info', as: 'patient_info'

  get '/index/role_selection/:role', to: 'index#role_selection'
  post '/patients', to: 'patients#sign_in', as: 'patient_sign_in'
  delete '/patients', to: 'patients#sign_out', as: 'patient_sign_out'
end
