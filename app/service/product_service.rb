class ProductService
  class << self
    def create_product!(attributes)
      Product.create!(attributes)
    end

    def update_product!(product, attributes)
      product.update!(attributes)
      product
    end
  end
end