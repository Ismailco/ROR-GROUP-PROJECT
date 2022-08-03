class ShoppingListController < ApplicationController
  def index
     foods = Food.includes(:recipes).where(user: current_user)
    @food_needed = foods.filter { |food| food.recipes.blank? }
    @food_total = @food_needed.count
    @total_value = @food_needed.sum(:price)
  end
end
