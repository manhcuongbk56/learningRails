Rails.application.routes.draw do
  resources :tests

  defaults format: :html do
    resources :products
  end

  namespace 'api', defaults: {format: :json}  do
    resources :products, only: [:index, :show, :create, :update, :destroy]
  end
  
end
