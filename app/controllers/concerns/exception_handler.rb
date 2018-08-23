module ExceptionHandler
  extend ActiveSupport::Concern
  
  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render html: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render html: { message: e.message }, status: :not_found
    end
  end
end