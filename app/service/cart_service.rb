class CartService
  class << self
    def create_cart!(attributes)
      Cart.create!(attributes)
    end

    def update_cart!(cart, attributes)
      cart.update(attributes)
      cart
    end

  end
end