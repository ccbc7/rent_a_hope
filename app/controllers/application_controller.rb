class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_q
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ,:user_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs

    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
  end

  private
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  # ----ransack---
  def search
    if @q.result.present?
      @results = @q.result
    end
  end

  def set_q
    @q = Room.ransack(params[:q])
  end
end
