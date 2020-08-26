class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully edited #{@user.username}'s profile'"
      redirect_to @user
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to the AlphaBlog, #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
