class Api::LineItemsController < ::LineItemsController
  def create
    LineItemsService.create_line_item!(line_item_params)
  end

  private
  def perform_action(options)
    yield
    render json: @line_item, status: options[:json_status]
  rescue ActiveRecord::RecordInvalid => error
    Rails.logger.error("#{error.message}\n#{error.backtrace.join("\n")}")
    render json: {error: error.message}, status: :unprocessable_entity
  end
end
