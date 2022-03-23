class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_render
  include ActionController::Cookies


  private

  def invalid_render(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: 422
  end

end
