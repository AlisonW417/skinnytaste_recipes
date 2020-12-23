class SkinnytasteRecipes::Recipe 
  attr_accessor :name, :url, :category, :ingredients 
  
  @@all = []
  
  def initialize(name, url, category)
    @name = name 
    @url = url 
    @category = category
    @ingredients = [] 
    add_to_category
    save
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    SkinnytasteRecipes::Scraper.get_recipes(@category) if @@all.empty?
    @@all 
  end 
  
  def add_to_category
    @category.recipes << self unless @category.recipes.include?(self)
  end 
  
  def find_ingredients 
    SkinnytasteRecipes::Scraper.get_ingredients(self) if @ingredients.empty?
  end
  
end 