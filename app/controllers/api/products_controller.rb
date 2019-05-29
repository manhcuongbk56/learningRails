class Api::ProductsController < ::ProductsController
  # GET /products.json
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/1.json
  def show
    render json: @product
  end

  # POST /products.json
  def create
    perform_action({json_status: :created}) do
      @product = ProductService.create_product!(product_params)
    end
  end

  # PATCH/PUT /products/1.json
  def update
    perform_action({json_status: :ok}) do
      @product = ProductService.update_product!(@product, product_params)
    end
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
    head :no_content 
  end

  private
  
  def perform_action(options)
    yield
    render json: @product, status: options[:json_status]
  rescue ActiveRecord::RecordInvalid => error
    Rails.logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    render json: {error: error.message}, status: :unprocessable_entity
  end
end
