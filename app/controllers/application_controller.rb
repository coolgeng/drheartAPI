# include ActionController::Serialization

class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :four_oh_four

    def four_oh_four
      render file: Rails.root.join("public", "error.json"), status: 404
    end
    
end
