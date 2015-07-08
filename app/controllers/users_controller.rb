class UsersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if  @user.save
      flash[:notice] = "your account was created successfully"
      redirect_to user_path @user
    else
      flash[:alert] ="there was a problem saving your account."
      redirect_to new_user_path
    end

  end 

def show 
    @user = User.find(params[:id])
    @title = @user.username
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end


  def update
    @user = params[:user]
  end

  protect_from_forgery with: :exception
end