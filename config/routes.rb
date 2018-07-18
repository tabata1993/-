Rails.application.routes.draw do


  resources :users do
    collection do
      post :confirm
    end
  end

  resources :sessions,only:[:new,:create,:destroy]

  resources :groups do
    collection do
      post :confirm
    end
  end

end
