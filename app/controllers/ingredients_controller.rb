class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to ingredient_path(@ingredient)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to ingredient_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
