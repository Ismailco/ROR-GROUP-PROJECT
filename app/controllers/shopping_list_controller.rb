class ShoppingListController < ApplicationController
  def index
    @food_needed = Food.includes(:recipe_foods).where(user_id: current_user.id, recipe_foods: { recipe_id: nil })
    @food_needed.count == 0 ? @food_amount = 0 : @food_amount = @food_needed.count
    @food_needed.sum(:price) == 0 ? @total_value = 0 : @total_value = @food_needed.sum(:price)
  end
end
