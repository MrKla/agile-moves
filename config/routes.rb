AgileMovesOs::Application.routes.draw do
  #get "reports/index"
  #match 'reports/index/:id' => 'reports#index', :as => :reports_path
  
  resources :reports  

  resources :interruptions


  resources :states


  resources :ratings


  resources :move_types


  resources :moves do
    resources :ratings
    resources :tomatoes do
      collection do
        put :done
        put :move
      end
    end
    collection do
      put :move
    end
  end
  
  resources :tomatoes do
    resources :interruptions
    collection do
      put :done
      put :move
    end
  end


  authenticated :user do
    root :to => 'moves#index'
  end
  root :to => "moves#index"
  devise_for :users
  resources :users
end