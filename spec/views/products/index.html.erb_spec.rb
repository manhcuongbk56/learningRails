require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      FactoryBot.create(:product),
      FactoryBot.create(:product)
    ])
  end

  it "renders a list of products" do
    render
  end
end
