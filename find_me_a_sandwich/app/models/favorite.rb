class Favorite < ActiveRecord::Base
  has_one :user
  has_one :menu_item
end
