class SkinnytasteRecipes::Scraper
  def self.get_categories
    doc = Nokogiri::HTML(open("https://www.skinnytaste.com/recipe-index/"))
    category = doc.css("div.recipe-cats div.item")
    category.each do |cat|
      name = cat.text 
      url = cat.css("a").attr("href").value
      SkinnytasteRecipes::Category.new(name, url)
    end 
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
  
  def self.get_ingredients(recipe)
    url = "#{recipe.url}"
    doc = Nokogiri::HTML(open(url))
    list = doc.css("li.wprm-recipe-ingredient")
    list.each do |li|
      ingredient = li.text.strip 
      recipe.ingredients << ingredient 
    end 
  end 
  
  def self.get_instructions(recipe)
    url = "#{recipe.url}"
    doc = Nokogiri::HTML(open(url))
    list = doc.css("li.wprm-recipe-instruction")
    list.each do |li|
      step = li.text.strip 
      recipe.instructions << step 
    end 
  end 
end 