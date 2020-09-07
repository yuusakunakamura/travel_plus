# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name])
  end
end
