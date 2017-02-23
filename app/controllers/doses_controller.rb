class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    id_for_redirect = @dose.cocktail_id
    @dose.destroy

    redirect_to cocktail_path(id_for_redirect)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end


end
