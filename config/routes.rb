Rails.application.routes.draw do



  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'toppages/index'
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  get 'help', to: 'entrysheet2s#help'
  resources :users, only:[:show,:new,:create]
  resources :entrysheet2s, only: [:index, :show, :new, :create] do
    member do
      get :download
      get :correctedindex
    end
    collection do
      get :serch
    end
    
  end
  resources :correctedentrysheet2s, only:[:index, :show, :new, :create] do
    member do
      get :download2
    end
  end
  
  
 
 end
