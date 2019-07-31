class Api::CartsController < ::CartsController

  #GET /carts.json
  def index
    @cart = Cart.all
    render json: @cart
  end

  #GET /carts/1.json
  def show
    render json: @cart
  end

  #POST /carts.json
  def create
    perform_action({jsonstatus: :created}) do
      @cart = CartService.create_cart!(cart_params)
    end
  end

  #PATCH/PUT /carts/1.json
  def update
    perform_action({jsonstatus: :updated}) do
      @cart = CartService.update_cart!(@cart, cart_params)
    end
  end

  #Delete /products.json
  def destroy
    @cart.destroy
    head :no_content
  end


  private

  def perform_action(options)
    yield
    render json: @cart, status: options[:json_status]
  rescue ActiveRecord::RecordInvalid => error
    Rails.logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    render json: {error: error.message}, status: :unprocessable_entity
  end
end