class DosesController < ApplicationController

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @ingredients = Ingredient.all
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktails_path
    else
      redirect_to cocktail_path(params[:cocktail_id])
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end

end
