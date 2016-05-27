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
    get '/find_day/:doc_id/:equip_id/:spec_id/:date', to: 'tickets#find_day'
    post '/tickets/:id', to: 'tickets#create'
  end

  namespace :doctor do
    resources :days
    resources :doctors
    get '/personal_info', to: 'doctors#personal_info', as: 'info'
    get '/days/change_time/:type/:id/:time', to: 'days#change_time'
    patch '/days/update/:id', to: 'days#update', as: 'day_create'
  end

  get 'patient/personal_info', to: 'patients#personal_info', as: 'patient_info'
  get 'patient/charts', to: 'patients#charts', as: 'patient_charts'

  get '/index/role_selection/:role', to: 'index#role_selection'
  post '/patients', to: 'patients#sign_in', as: 'patient_sign_in'
  delete '/patients', to: 'patients#sign_out', as: 'patient_sign_out'
end
