class LikesController < ApplicationController
  before_action :post_params

  def create
    @like = Like.create(user_id: current_user.id, animal_id: params[:id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, animal_id: params[:id]).destroy
  end

private

  def post_params
    @animal = Animal.find(params[:id])
  end
end
