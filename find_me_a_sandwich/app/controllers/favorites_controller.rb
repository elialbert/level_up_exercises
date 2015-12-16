class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def friends
    @friends = User.visible
    @total_count = 0
    @friends_favorites = @friends.each_with_object([]) do |e, a|
      a << {name: e.full_name, favorites: e.favorites}
      @total_count += e.favorites.count
    end
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
