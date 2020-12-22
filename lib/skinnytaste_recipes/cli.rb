class SkinnytasteRecipes::CLI 
  def call 
    puts "Welcome to the Skinnytaste Recipe Selector!"
    find_categories
    display_categories
    get_user_category
    display_recipes(category_input)
  end 
  
  def find_categories 
    @category = SkinnytasteRecipes::Category.all
  end 
  
  def display_categories 
    puts "Please choose a recipe category. \nEnter the number for the category you'd like to view (1-14):"
    #binding.pry
    @category.each.with_index(1) do |cat, index|
      puts "#{index}. #{cat.name}"
    end 
    #category.each.with_index(1) do |cat, index|
      #puts "#{index}. #{cat.text}"
    #end 
    # SkinnytasteRecipes::Scraper.get_categories
    # move this to category class later
  end 
  
  def get_user_category
    category_input = gets.strip.to_i 
    display_recipes(category_input) if valid_input(category_input, @category)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def display_recipes(category_input)
    category = @category[category_input - 1]
    #binding.pry
    category.find_recipes
    puts "Here are the recipes for you the #{category.name} category:"
    category.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name}"
    end 
    # add code here to display the recipes 
  end
end 