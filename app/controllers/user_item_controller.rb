class UserItemController < ApplicationController
  def index
    @user_id = params[:id]
    @item_ids = UserItem.select("item_id").where(:user_id => @user_id)
    @items_info = ProstorItem.where("item_id in #{@item_ids}")
    @user_items = UserItem.where(:user_id => @user_id)
  end
end
