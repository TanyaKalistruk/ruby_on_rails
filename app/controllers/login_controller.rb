class LoginController < ApplicationController
  def log_in
  end

  def sign_in
    @name = params[:visitor_name]
    @login = params[:visitor_login]
    @password = params[:visitor_password]
    @users = User.all
    @flag = true
    @counter = 0
    unless @login.blank?
      @users.each do |user|
        @counter +=1
        if user.username == @login and user.password == @password
          @flag = false
          @counter = user.user_id+1
          break
        end
      end
    end
    if @flag
      @entry = User.create({:user_id => @counter, :name => @name, :username => @login, :password => @password})
      # @entry = User.create({:name => @name, :username => @login, :password => @password})
    end
    redirect_to("/prostor/index/#{@counter}")
  end
end
