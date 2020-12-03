class LoginController < ApplicationController
  def log_in
  end

  def sign_in
    @name = params[:visitor_name]
    @login = params[:visitor_login]
    @password = params[:visitor_password]
    @users = User.all
    @flag = true
    @counter = 1
    unless @login.blank?
      @users.each do |user|
        if user.username == @login and user.password == @password
          @flag = false
          @counter = user.user_id
          break
        end
        @counter +=1
      end
    end
    if @flag
      @entry = User.create({:user_id => @counter, :name => @name, :username => @login, :password => @password})

    end
    redirect_to("/prostor/index/#{@counter}")
  end
end
