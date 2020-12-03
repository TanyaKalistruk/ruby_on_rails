class ProstorController < ApplicationController
  @user_id
  def new
  end

  def create
    @name = params[:item_name]
    @price = params[:item_price]
    @item_id = ProstorItem.all.length + 1
    unless @name.blank? and @price.blank?
      @entry = ProstorItem.create({:item_id => @item_id, :item_name => @name, :price => @price})
    end
    puts("user_id is #{@user_id}")
    redirect_to("/prostor/index/#{@user_id}")
  end

  def edit
    @item = ProstorItem.find(params[:id].to_i)
  end

  def update
    @name = params[:item_name]
    @price = params[:item_price]
    @item_id = params[:item_id][0].to_i
    ProstorItem.where({:item_id => @item_id}).update_all({:item_name => @name, :price => @price})
    rescue ActiveRecord::RecordNotFound
      puts("No records")
    redirect_to("/prostor/index/#{@user_id}")
  end

  def destroy
    @item_id = params[:id].to_i
    ProstorItem.destroy(@item_id)
    rescue ActiveRecord::RecordNotFound
      puts("No records")
    redirect_to("/prostor/index/#{@user_id}")
  end

  def index
    @user_id = params[:id]
    @name = User.find(@user_id)["name"]
    @items = ProstorItem.all
  end
end
