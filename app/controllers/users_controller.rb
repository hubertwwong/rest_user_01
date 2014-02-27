class UsersController < ApplicationController

  # skips csrf token
  skip_before_filter  :verify_authenticity_token

  respond_to :json

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def destroy
    @user = User.find(params[:id])
  end

  #def edit
  #  @user = User.find(params[:id])
  #end

  def index
    @users = User.all
    respond_with(@users)
  end

  #def new
  #  @user = User.new
  #end
  
  def update
    @user = User.find(params[:id])
  end
  
  private

  # strong params..
  # new to rails 4.
  # basically you have to explictly permit params.
  # probably don't want the user_id to be allowed.
  # devise should be keeping track of this for you
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
