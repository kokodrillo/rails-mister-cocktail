class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(description: params[:dose][:description], cocktail: @cocktail, ingredient: @ingredient)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
   end

    # @ingredient.cocktail = @cocktail
    # if @ingredient.save
    #   redirect_to cocktail_path(@cocktail), notice: "Ingredient created!"
    # else
    #   render :new
    # end

    # @dose = Dose.new(params_dose)
    # @dose.cocktail = @cocktail
    # if @dose.save
    #   redirect_to cocktail_path(@cocktail), notice: "Dose created!"
    # else
    #   render :new
    # end
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient, :cocktail) # i get cocktail from route, other two from form
  end

  def params_ingredient
     params.require(:ingredient).permit(:dose, :name, :cocktail)
  end
end
