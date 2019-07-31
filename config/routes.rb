Rails.application.routes.draw do

  root 'store#index', as: 'store_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  defaults format: :html do
    resources :products
    resources :line_items
    resources :carts
  end

  namespace 'api', defaults: {format: :json} do
    resources :products, only: [:index, :show, :create, :update, :destroy]
    resources :carts, only: [:index, :show, :create, :update, :destroy]
    resources :line_items, only: [:index, :show, :create, :update, :destroy]
  end

end
