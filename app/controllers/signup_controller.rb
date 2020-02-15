class SignupController < ApplicationController

  def new0

  end
  
  def new1
    @user = User.new 
  end

  def new2
     session[:name] = user_params[:name]
     session[:email] = user_params[:email]
     session[:password] = user_params[:password]
     @user = User.new
  end
  
  
  
  def create
    @user = User.new(
      name: session[:name], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      prefecture: user_params[:prefecture],
      city: user_params[:city]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to new3_signup_index_path
    else
      render 'new1'
    end
  end

  def new3
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :prefecture,
      :city
    )
  end

end
