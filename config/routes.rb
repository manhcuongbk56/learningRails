Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :html do
    resources :products
  end

  namespace 'api', defaults: {format: :json} do
    resources :products, only: [:index, :show, :create, :update, :destroy]
  end

end
