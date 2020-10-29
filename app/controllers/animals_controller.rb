class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    @user = current_user
  end

  def show
    @animal = Animal.find(params[:id])
    #@animal = Animal.find_by(id: params[:id])
    @user = User.find_by(id: @animal.user_id)
    @animals = @user.animals
    #@newanimal = Animal.new
    #@comment = Comment.new
    #@comments = @animal.comments
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
    if @animal.save
    redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
    @animals = Animal.all
  end

  def destroy
    @animal = Animal.find(params[:id])
      @animal.destroy
      redirect_to animals_path
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
    redirect_to animal_path(@animal.id),notice: "アップデートに成功しました！"
    else
      render :edit
    end
  end
private
  def animal_params
    params.require(:animal).permit(:animal_name, :image, :caption)
  end
end
