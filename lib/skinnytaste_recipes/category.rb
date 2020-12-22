class SkinnytasteRecipes::Category 
  attr_accessor :name, :url 
  
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
    SkinnytasteRecipes::Scraper.get_categories if @@all.empty?
    @@all
  end 
    
end 