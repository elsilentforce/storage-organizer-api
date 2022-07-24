Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    
    namespace :v1 do
      
      devise_for :users, controllers: { sessions: :sessions },
                         path_names: { sign_in: 'login' }

      resources :containers, only: :show do
        get '/items', to: 'containers#items'
      end

    end
  end
end
