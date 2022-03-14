class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Thanks for signing up!"
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your account has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to events_path, alert: "Account successfully deleted"
  end


  private
    def user_params
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation)
    end

    def require_correct_user
      @user = User.find(params[:id])
      redirect_to events_url, alert: "Not authorized" unless current_user?(@user)
    end


end
