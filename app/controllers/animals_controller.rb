class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
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
  end

private
  def animal_params
    params.require(:animal).permit(:animal_name, :image, :caption)
  end
end
