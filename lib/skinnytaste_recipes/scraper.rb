class SkinnytasteRecipes::Scraper
  def self.get_categories
    doc = Nokogiri::HTML(open("https://www.skinnytaste.com/recipe-index/"))
    #binding.pry 
    category = doc.css("div.recipe-cats div.item")
    category.each.with_index(1) do |cat, index|
      puts "#{index}. #{cat.text}"
    end 
  end 
  
end 