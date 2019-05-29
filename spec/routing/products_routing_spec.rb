require 'rails_helper'

describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/products').to route_to('products#index', {format: :html})
    end

    it 'routes to #new' do
      expect(get: '/products/new').to route_to('products#new', {format: :html})
    end

    it 'routes to #show' do
      expect(get: '/products/1').to route_to('products#show', {id: '1', format: :html})
    end

    it 'routes to #edit' do
      expect(get: '/products/1/edit').to route_to('products#edit', {id: '1', format: :html})
    end

    it 'routes to #create' do
      expect(post: '/products').to route_to('products#create', {format: :html})
    end

    it 'routes to #update via PUT' do
      expect(put: '/products/1').to route_to('products#update', {id: '1', format: :html})
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/products/1').to route_to('products#update', {id: '1', format: :html})
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1').to route_to('products#destroy', {id: '1', format: :html})
    end
  end
end
