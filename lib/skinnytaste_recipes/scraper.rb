class SkinnytasteRecipes::Scraper
  def self.get_categories
    doc = Nokogiri::HTML(open("https://www.skinnytaste.com/recipe-index/"))
    #binding.pry 
    category = doc.css("div.recipe-cats div.item")
    category.each do |cat|
      name = cat.text 
      url = cat.css("a").attr("href").value
      SkinnytasteRecipes::Category.new(name, url)
    end 
    #category.each.with_index(1) do |cat, index|
      #puts "#{index}. #{cat.text}"
    #end 
  end 
  
  def self.get_recipes(category) 
    url = "#{category.url}"
    doc = Nokogiri::HTML(open(url))
    #binding.pry 
    recipe = doc.css("div.archive-post")
    recipe.each do |recipe|
      name = recipe.css("a").attr("title").text 
      url = recipe.css("a").attr("href").value
      SkinnytasteRecipes::Recipe.new(name, url, category)
    end 
  end 
    
  
end 