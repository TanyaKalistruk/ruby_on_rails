class UserItemController < ApplicationController
  def index
    @user_id = cookies[:user_id]
    @item_ids = []
    UserItem.where(:user_id => @user_id).each do |user_item|
      @item_ids.append(user_item.item_id)
    end
    puts("items ids #{@item_ids}")
    @items_info = []
    ProstorItem.all.each do |prostor_item|
      if @item_ids.include? prostor_item.item_id
        @items_info.append(prostor_item)
    end
    puts("items info #{@items_info}")

    @user_items = UserItem.where(:user_id => @user_id)
    end
  end

  def add
    @user_id = cookies[:user_id]
    @item_id = params[:id]
    @items = UserItem.all
    @count = 0
    @items.each do |item|
      if item.user_id == @user_id and item.item_id == @item_id
        @count = item.count
        break
      end
    end
    UserItem.create({:item_id => @item_id, :user_id => @user_id, :count => @count+1})
    redirect_to("/prostor/index")
  end
end
