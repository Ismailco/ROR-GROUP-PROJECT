class ShoppingListController < ApplicationController
  def index
    @food_needed = Food.includes(:recipe_foods).where(user: current_user)
    @food_amount = @food_needed.count.zero? ? 0 : @food_needed.count
    @total_value = @food_needed.sum(:price).zero? ? 0 : @food_needed.sum(:price)
  end
end
