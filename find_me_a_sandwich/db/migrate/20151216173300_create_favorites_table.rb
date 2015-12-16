class CreateFavoritesTable < ActiveRecord::Migration
  def change
    create_table :favorites_tables do |t|
      t.belongs_to :user, index: true
      t.belongs_to :menu_item, index: true
    end
  end
end
