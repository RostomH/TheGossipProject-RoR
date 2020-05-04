class FrontController < ApplicationController 
  def team
  end

  def contact
  end

  def welcome
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts @first_name = params[:first_name]
    puts "$" * 60
  end
end
