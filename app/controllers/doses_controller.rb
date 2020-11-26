class DosesController < ApplicationController
  def new
    # create a new instance and pass it to new html
    @dose = Dose.new
    # find the cocktail to update the dose to
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # pass the params from the new form over to create the new Dose
    @dose = Dose.new(params_dose)
    # find the cocktail to create dose for
    @cocktail = Cocktail.find(params[:cocktail_id])
    # assign the new dose created to the correct cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      # if saved, go to the cocktail/:id url
      redirect_to cocktail_path(@cocktail)
    else
      # render new goes to the new.html.erb file form
      render :new
    end
  end

  def destroy
    # find the dose to destroy
    @dose = Dose.find(params[:id])
    # find the cocktail of that dose
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
