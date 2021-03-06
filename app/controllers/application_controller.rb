class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Displays the correct error when a record is nor found
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  #Render not found page
  def render_404
  	respond_to do |format|
  		format.html {render file: "#{Rails.root}/public/404", layout: false, status: :not_found}
  		format.xml {head :not_found}
  		format.any {head :not_found}
  	end
  end


end
