class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:is_deleted])
  end

private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    admin_path #
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path #ここを好きなパスに変更
  end

end