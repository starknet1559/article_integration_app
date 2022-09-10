class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password])
      if @user.is_deleted == true
        redirect_to new_user_registration_path
      end
    end
  end
end
