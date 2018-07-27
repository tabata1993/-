Rails.application.routes.draw do
  root to: 'groups#home'

  resources :users do
    collection do
      post :confirm
      get :pass_edit
      get :destroy_confirm
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

  resources :boards

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
