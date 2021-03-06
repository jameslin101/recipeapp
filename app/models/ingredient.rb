class Ingredient < ActiveRecord::Base
  attr_accessible :name

  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients
  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive => false
  
  def name=(str)
    write_attribute(:name, str.strip.downcase.singularize)
  end
  
end
