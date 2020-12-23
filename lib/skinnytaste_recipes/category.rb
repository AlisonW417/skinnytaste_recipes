class SkinnytasteRecipes::Category 
  attr_accessor :name, :url, :recipes 
  
  @@all = []
  
  def initialize(name, url)
    @name = name 
    @url = url
    @recipes = []
    save 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    SkinnytasteRecipes::Scraper.get_categories if @@all.empty?
    @@all
  end 
  
  def find_recipes 
    SkinnytasteRecipes::Scraper.get_recipes(self) if @recipes.empty?
  end 
end 