class SessionsController < ApplicationController

	def new

	end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = 'Successfully Logged In!'
      redirect_to '/'
    else

    	flash[:warning] = "Invalid Username or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end