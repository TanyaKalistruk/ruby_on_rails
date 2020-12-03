class LoginController < ApplicationController
  def log_in
  end

  def log_out
    cookies.delete(:user_id)
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
    cookies[:user_id] = @counter
    redirect_to("/prostor/index")
  end
end
