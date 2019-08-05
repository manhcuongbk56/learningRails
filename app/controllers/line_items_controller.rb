require 'pry'
class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:destroy]


  # POST /line_items
  # POST /line_items.json
  def create
    options = {
        html_notice: 'Line item was successfully created.',
        html_error_action: :new
    }
    perform_action(options) do
      product = Product.find(params[:product_id])
      @line_item = @cart.line_items.build(product: product)
      @line_item.save
    end
  end



  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end

    def perform_action(option)
      yield
      redirect_to @line_item.cart, notice: option[:html_notice]
    rescue ActiveRecord::RecordInvalid => error
      Rails.logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
      render options[:html_error_action]
    end
end
