class UsersController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], first_name: params[:first_name], last_name: params[:last_name], age: params[:age], city_id: City.first.id)
    if @user.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Votre inscription est bien enregistrée"
      session[:user_id] = @user.id
      redirect_to gossips_path  # si ça marche, il redirige vers la page d'index du site
    else
      flash[:failure] = "Entrée incorrecte"
      render "users/new" # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end


end
