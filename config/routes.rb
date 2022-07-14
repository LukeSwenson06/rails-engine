Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find_all', to: 'search#index'
        get '/:id/merchant', to: 'merchant#index'
      end

      namespace :merchants do
        get '/:id/items', to: 'items#index'
      end

      resources :merchants, only: %i[index show]
      resources :items, only: %i[index show create destroy update]
      

    end
  end
end
