class DosesController < ApplicationController
  def new
    # create a new instance and pass it to new html
    @dose = Dose.new
    # find the cocktail to update
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # assign it to the correct cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    # find the cocktail to destroy the dose
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def params_dose
    # as dose have Foreign keys, you need to permit it as well
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
