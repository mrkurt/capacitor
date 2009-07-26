class UsersController < ApplicationController  
  def login
    if request.post?
      u = User.find_by_email params[:email]
      u = User.create(:email => params[:email], :name => params[:email], :password => '') if u.nil?
      session[:user_id] = u.id
    
      redirect_back_or_default('/')
    end
  end
  
  def logout
    logout_keeping_session!
    redirect_back_or_default('/')
  end
end
