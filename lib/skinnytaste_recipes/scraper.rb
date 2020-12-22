class SkinnytasteRecipes::Scraper
  def self.get_categories
    doc = Nokogiri::HTML(open("https://www.skinnytaste.com/recipe-index/"))
    category = doc.css("div.recipe-cats div.item").text
  end 
  
end 