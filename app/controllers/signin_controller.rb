class SigninController < ApplicationController
  def index
    if current_user.present?
        redirect_to root_path
    end
  end
  def create 
    user = User.find_by(email:params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      render :index
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
