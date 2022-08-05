class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe if @recipe.user_id == current_user.id
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = 'You have update the recipe status to private'
    else
      @recipe.update(public: true)
      flash[:notice] = 'You have update the recipe status to public'
    end
    redirect_to recipes_path
  end

  # DELETE /recipes/1
  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user
      @recipe.destroy
      flash[:success] = 'Recipe was successfully destroyed.'
      redirect_to recipes_path, status: :see_other
    else
      flash[:danger] = "You can't delete somebody else's account"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
