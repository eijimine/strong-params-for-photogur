class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def create

    @user = User.new(user_params)

    # @user = User.create(
    #   email: params[:user][:email],
    #   password: params[:user][:password],
    #   password_confirmation: params[:user][:password_confirmation]
    #   )
      if @user.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

end
