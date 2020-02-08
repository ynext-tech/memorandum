Rails.application.routes.draw do
  devise_for :users
  root to: 'shops#index'
  resources :signup do
    collection do
      get :new1, :new2, :new3
    end
  end

  resources :shops do
    
  end

  
end
