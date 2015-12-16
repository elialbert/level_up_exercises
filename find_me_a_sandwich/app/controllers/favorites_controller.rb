class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def create
    Favorite.create(user_id: current_user.id, 
                    menu_item_id: favorite_params[:menu_item_id])
    redirect_to :back
  end

  def destroy
    Favorite.where(user_id: current_user.id, 
                   menu_item_id: favorite_params[:menu_item_id]).delete_all
    redirect_to :back
  end

  def favorite_params
    params.permit(:menu_item_id)
  end
end
