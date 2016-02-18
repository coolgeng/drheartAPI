# include ActionController::Serialization

class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from Exception, :with => :render_500
    
    def render_404
      render file: Rails.root.join("public", "404.json"), status: 404
    end
    
    def render_500(exception)
        @exception = exception
        render file: Rails.root.join("public", "500.json"), :status => 500
    end
    
end
