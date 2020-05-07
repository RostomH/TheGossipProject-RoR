class GossipsController < ApplicationController
  def index
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'anonymous'))
  end

  def new
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'anonymous'))
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'anonymous')) # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Le gossip a bien été enregistré"
      redirect_to gossips_path  # si ça marche, il redirige vers la page d'index du site
    else
      flash[:failure] = "Entrée incorrecte"
      render "gossips/new" # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end
  

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def show
    @gossip = Gossip.find(params[:id])
    @id = params[:id]
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content], user: User.find(params[:user]))
      flash[:success] = "Le potin a été mis à jour avec succès."
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end
  
end

