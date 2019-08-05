require "rails_helper"

RSpec.describe LineItemsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/line_items").to route_to("line_items#create", {format: :html})
    end

    it "routes to #destroy" do
      expect(:delete => "/line_items/1").to route_to("line_items#destroy", {format: :html, id: '1'} )
    end
  end
end
