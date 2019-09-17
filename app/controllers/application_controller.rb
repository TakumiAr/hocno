class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/users/#{current_user.id}"
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
