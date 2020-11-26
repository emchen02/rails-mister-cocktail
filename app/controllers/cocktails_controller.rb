class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    # find the cocktail and pass it to view
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    # take the input from new.html form to create new instance
    @cocktail = Cocktail.new(params_cocktails)
    if @cocktail.save
       redirect_to cocktail_path(@cocktail)
    else
      # sends you to the action #new again
      render :new
    end
  end

  private

  def params_cocktails
    params.require(:cocktail).permit(:name)
  end

end
