class CitiesController < ApplicationController
  def show
    @city = params[:id]
  end
end
