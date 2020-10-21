class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @newAnimal = Animal.new
    @animals = @user.animals
    #@animals = Animal.all
  end

  def show
    @user = User.find(params[:id])
    @newAnimal = Animal.new
    @animals = @user.animals
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    #binding.pry
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
