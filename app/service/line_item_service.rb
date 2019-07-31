class LineItemsService
  class << self
    def create_line_item!(attributes)
      LineItem.create!(params)
    end

    def update_line_item!(item, attributes)
      item.update!(attributes)
      item
    end
  end
end