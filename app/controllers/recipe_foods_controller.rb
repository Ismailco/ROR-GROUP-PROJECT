class RecipeFoodsController < ApplicationController
  # POST /recipe_foods or /recipe_foods.json
  def create
    recipe = Recipe.find(params[:recipe_id])
    @recipe_food = recipe.recipe_foods.new(recipe_food_params)
    @recipe_food.recipe = recipe
    @recipe_food.save

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(recipe), notice: 'Food was successfully added to recipe.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
