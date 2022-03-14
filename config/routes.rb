Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      scope :items do
        get '/:id', to: 'items#show', as: 'item_show'
      end

      scope :containers do
        get '/:id', to: 'containers#show', as: 'container_show'
        get '/:id/items', to: 'containers#items', as: 'container_items'
      end

    end
  end
end
