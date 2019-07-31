require 'rails_helper'
require 'pry'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    @line_items = assign(:line_items, [
        create(:line_item),
        create(:line_item)
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
