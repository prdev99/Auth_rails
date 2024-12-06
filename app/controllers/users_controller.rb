class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      rediret_to root_path, notice: 'Please check your email for the confirmation instruction'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
