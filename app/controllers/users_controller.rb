class UsersController < ApplicationController

	def new

	end

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    redirect_to '/'
	  else
	    redirect_to '/users/new'
	  end
	end

	def login
	  @user = User.find_by_email(params[:email])
		  if @user.password == params[:password]
				session[:user_id] = user.id
			  flash[:success] = 'Successfully Logged In!'
			  redirect_to '/'
		  else
	  		flash[:warning] = "Invalid Username or Password"
	  		redirect_to '/login'
		  end
	end

	private
		def user_params
		  params.require(:user).permit(:email, :password)
		end

end

