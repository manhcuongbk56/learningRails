class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    options = {
      html_notice: 'Product was successfully created.',
      json_render: :show,
      json_status: :created,
      html_error_action: :new
    }

    perform_action(options) do
      @product = ProductService.create_product!(product_params)
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    options = {
      html_notice: 'Product was successfully updated.',
      json_render: :show,
      json_status: :ok,
      html_error_action: :edit
    }
    
    perform_action(options) do
      @product = ProductService.update_product!(@product, product_params)
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price)
  end

  def perform_action(options)
    yield

    respond_to do |format|
      format.html { redirect_to @product, notice: options[:html_notice] }
      format.json { render options[:json_render], status: options[:json_status], location: @product }
    end
  rescue ActiveRecord::RecordInvalid => error
    Rails.logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    respond_to do |format|
      format.html { render options[:html_error_action] }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
end
