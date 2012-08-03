class Recipe < ActiveRecord::Base
  attr_accessible :description, :name, :recipe_ingredients_attributes

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients, :uniq => true

  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive => false

  accepts_nested_attributes_for :recipe_ingredients, 
                                :allow_destroy => true,
                                :reject_if => lambda { |a| a[:quantity].blank? ||
                                                           a[:ingredient_name].blank?}
                                

end
