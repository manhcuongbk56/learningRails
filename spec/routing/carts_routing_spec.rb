require "rails_helper"

RSpec.describe CartsController, type: :routing do
  describe "routing html" do
    it "routes to #index" do
      expect(:get => "/carts").to route_to("carts#index", {format: :html})
    end

    it "routes to #new" do
      expect(:get => "/carts/new").to route_to("carts#new", {format: :html})
    end

    it "routes to #show" do
      expect(:get => "/carts/1").to route_to("carts#show", {format: :html, :id => '1'})
    end

    it "routes to #edit" do
      expect(:get => "/carts/1/edit").to route_to("carts#edit", {format: :html, :id => '1'})
    end


    it "routes to #create" do
      expect(:post => "/carts").to route_to("carts#create", {format: :html})
    end

    it "routes to #update via PUT" do
      expect(:put => "/carts/1").to route_to("carts#update", {format: :html, :id => '1'})
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/carts/1").to route_to("carts#update", {format: :html, :id => '1'})
    end

    it "routes to #destroy" do
      expect(:delete => "/carts/1").to route_to("carts#destroy", {format: :html, :id => '1'})
    end
  end
end
