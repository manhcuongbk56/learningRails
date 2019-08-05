class LineItemsService
  class << self
    def create_line_item!(params)
      product = Product.find(params[:product_id])
      @line_item = @cart
      LineItem.create!(params)
    end

    def update_line_item!(item, attributes)
      item.update!(attributes)
      item
    end
  end
end