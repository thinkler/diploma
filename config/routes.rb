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
    get '/ticket_pdf/:id', to: 'tickets#to_pdf', as: 'pdf'
  end

  namespace :doctor do
    resources :days
    resources :doctors
    resources :patients
    resources :tickets
    get '/personal_info', to: 'doctors#personal_info', as: 'info'
    get '/days/change_time/:type/:id/:time', to: 'days#change_time'
    patch '/days/update/:id', to: 'days#update', as: 'day_create'
    get '/patient/:id/notes/new', to: 'patients#new_note', as: 'new_note'
    post '/patient/:id/notes/create', to: 'patients#create_note', as: 'create_note'
  end

  get 'patient/personal_info', to: 'patients#personal_info', as: 'patient_info'
  get 'patient/charts', to: 'patients#charts', as: 'patient_charts'
  get 'doctor/charts', to: 'doctors#charts', as: 'doctor_charts'

  get '/index/role_selection/:role', to: 'index#role_selection'
  post '/patients', to: 'patients#sign_in', as: 'patient_sign_in'
  delete '/patients', to: 'patients#sign_out', as: 'patient_sign_out'
end
