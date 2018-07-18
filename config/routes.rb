Rails.application.routes.draw do

  resources :users do
    collection do
      post :confirm
    end
  end
  resources :groups do
    collection do
      post :confirm
    end
  end

end
