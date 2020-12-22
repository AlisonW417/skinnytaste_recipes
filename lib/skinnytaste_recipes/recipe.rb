class SkinnytasteRecipes::Recipe 
  attr_accessor :name, :url, :category 
  
  @@all = []
  
  def initialize(name, url)
    @name = name 
    @url = url 
    save
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    SkinnytasteRecipes::Scraper.get_recipes(category) if @@all.empty?
    @@all 
  end 
  
end 