class FrontController < ApplicationController 
  def team
  end

  def contact
  end

  def home
  end
  
  def welcome
    @first_name = User.find_by(id: session[:user_id]).first_name
  end

  def showgossip
    @id = params[:id]
  end

  def showuser
    @id = params[:id]
  end
end
