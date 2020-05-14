class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktail_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
