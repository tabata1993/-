Rails.application.routes.draw do
  root to: 'groups#index'

  resources :users do
    collection do
      post :confirm
      get :pass_edit
    end
  end


  resources :sessions,only:[:new,:create,:destroy]

  resources :groups do
    collection do
      post :confirm
      get :manager_edit
    end
  end

  resources :joins,only:[:create,:destroy]

end
