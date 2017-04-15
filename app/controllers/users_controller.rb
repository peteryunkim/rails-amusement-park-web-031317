class UsersController < ApplicationController

	def index

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.valid? && session[:user_id].present?
			session.destroy
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		elsif @user.valid?
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)

		else
			redirect_to signup_path
		end
	end

	def show

		if session[:user_id].present?
			@user = User.find(params[:id])
		else
			redirect_to "/"
		end

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		# binding.pry
		if @user.password == params[:password]
			@user.update(user_params)
			redirect_to user_path(@user)
		else
			redirect_to edit_path(@user)
		end
	end


private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets, :admin)
	end

	def admin?
		if admin == 0
			self.admin = false
		else
			self.admin = true
		end
	end
end
