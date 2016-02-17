class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	if not @user.errors
  		@user.errors = nil
  	end
  end

  def create
  	@user = User.create(first_name:params[:first_name], last_name:params[:last_name], email_address:params[:email_address], password:params[:password])
  	if @user.valid?
  		redirect_to '/users'
  	else
  		flash[:errors] = @user.errors
  		redirect_to '/users/new'
  	end
  end
end
