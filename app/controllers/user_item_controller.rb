class UserItemController < ApplicationController
  def index
    @user_id = cookies[:user_id]
    @item_ids = []
    UserItem.where(:user_id => @user_id).each do |user_item|
      @item_ids.append(user_item.prostor_item_id)
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
    @user_id = cookies[:user_id].to_i
    @item_id = params[:id].to_i
    if UserItem.exists?({:prostor_item_id => @item_id, :user_id => @user_id})
      @count = UserItem.where({:prostor_item_id => @item_id, :user_id => @user_id})[0]["count"]
      puts("count is #{@count}")
      UserItem.where({:prostor_item_id => @item_id, :user_id => @user_id}).update_all({:count => @count+1})
    else
      puts(User.where({:user_id => @user_id}))
      puts(ProstorItem.where({:item_id => @item_id}))
      UserItem.create({:prostor_item_id => @item_id, :user_id => @user_id, :count => 1})
    end
    redirect_to("/prostor/index")
  end
end
