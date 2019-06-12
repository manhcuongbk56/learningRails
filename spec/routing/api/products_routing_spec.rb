require 'rails_helper'

RSpec.describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/products').to route_to('api/products#index', {format: :json})
    end

    it 'routes to #show' do
      expect(get: '/api/products/1').to route_to('api/products#show', {id: '1', format: :json})
    end

    it 'routes to #create' do
      expect(post: '/api/products').to route_to('api/products#create', {format: :json})
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/products/1').to route_to('api/products#update', {id: '1', format: :json})
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/products/1').to route_to('api/products#update', {id: '1', format: :json})
    end

    it 'routes to #destroy' do
      expect(delete: '/api/products/1').to route_to('api/products#destroy', {id: '1', format: :json})
    end
  end
end
