require 'rails_helper'
require 'pry'
RSpec.describe "products/index", type: :view do
  before(:each) do
    @product = assign(:products, [
      create(:product),
      create(:product)
    ])
  end

  it "renders a list of products" do
    # skip("skip view test for now")
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
