class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :quantity, :ingredient_name
  
  belongs_to :ingredient
  belongs_to :recipe
  
  def ingredient_name=(str)
    self.ingredient = Ingredient.find_or_create_by_name(str.strip.downcase.singularize) if str.present?
  end
  
  def ingredient_name
    self.ingredient.name if self.ingredient
  end
  
  def recipe_name
    self.recipe.name if self.recipe
  end
end
