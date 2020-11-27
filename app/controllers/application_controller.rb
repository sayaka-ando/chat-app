class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # →ログイン状態に応じて対応してくれる。未ログインユーザーはログインページに戻せる
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 「特定のカラムを許容する」メソッド。今回は「nameカラム」を追加したので「name」キーの内容の保存をpermitメソッドで許可
  end
end
