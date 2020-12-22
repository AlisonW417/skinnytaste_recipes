class SkinnytasteRecipes::Recipe 
  attr_accessor :name, :url, :category 
  
  @@all = []
  
  def initialize(name, url, category)
    @name = name 
    @url = url 
    @category = category
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
  
end 