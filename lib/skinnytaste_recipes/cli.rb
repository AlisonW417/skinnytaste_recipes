class SkinnytasteRecipes::CLI 
  def call 
    puts "Welcome to the Skinnytaste Recipe Selector!"
    find_categories
    display_categories
    get_user_category
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
    puts "Here are the recipes for the #{category.name} category:"
    category.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name}"
    end
    get_user_recipe(category)
  end
  
  def get_user_recipe(category)
    puts "Choose a recipe to see the ingredient list (1-30):"
    recipe_input = gets.strip.to_i 
    #binding.pry
    if recipe_input.between?(1, 30)
      recipe = category.recipes[recipe_input - 1]
      recipe.find_ingredients
      recipe.ingredients.each do |ingredient|
        puts "#{ingredient}"
      end 
    else 
      puts "Please enter a valid recipe number."
      get_user_recipe(category)
    end 
  end
  
  
end 