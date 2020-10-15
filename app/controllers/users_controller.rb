class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @newAnimal = Animal.new
    @animals = @user.animals
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to animals_path(user.id)
  end
end
