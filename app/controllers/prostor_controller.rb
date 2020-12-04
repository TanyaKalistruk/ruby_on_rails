class ProstorController < ApplicationController
  def new
  end

  def create
    @name = params[:item_name]
    @price = params[:item_price]
    @item_id = ProstorItem.all.length + 1
    unless @name.blank? and @price.blank?
      @entry = ProstorItem.create({:item_id => @item_id, :item_name => @name, :price => @price,
                                   :is_deleted =>"false"})
    end
    redirect_to("/prostor/index")
  end

  def edit
    @item = ProstorItem.find(params[:id].to_i)
  end

  def update
    @name = params[:item_name]
    @price = params[:item_price]
    @item_id = params[:item_id][0].to_i
    ProstorItem.where({:item_id => @item_id}).update_all({:item_name => @name, :price => @price})
    redirect_to("/prostor/index")
  end

  def destroy
    @item_id = params[:id].to_i
    ProstorItem.where({:item_id => @item_id}).update_all({:is_deleted => "true"})
    redirect_to("/prostor/index")
  end

  def index
    @user_id = cookies[:user_id]
    @user = User.find(@user_id)
    @items = ProstorItem.all
  end
end
