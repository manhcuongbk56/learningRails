require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, FactoryBot.create(:product))
  end

  it "renders new product form" do
    render
  end
end
