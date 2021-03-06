class SkinnytasteRecipes::CLI 
  def call 
    puts "\nWelcome to the Skinnytaste Recipe Selector!"
    @input = ""
    until @input == "exit"
      find_categories
      display_categories
      get_user_category
    end 
    goodbye
  end 
  
  def find_categories 
    @category = SkinnytasteRecipes::Category.all
  end 
  
  def display_categories 
    @category.each.with_index(1) do |cat, index|
      puts "#{index}. #{cat.name}"
    end
    puts "\nPlease choose a recipe category. \nEnter the number for the category you'd like to view (1-14)."
  end 
  
  def get_user_category
    category_input = gets.strip.to_i 
    if valid_input(category_input, @category)
      display_recipes(category_input) 
    else 
      puts "\nInvalid input. Please enter a number from the category list (1-14)."
      get_user_category
    end 
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  def display_recipes(category_input)
    category = @category[category_input - 1]
    category.find_recipes
    puts "\nHere are the recipes for the #{category.name} category:"
    category.recipes.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.name}"
    end
    get_user_recipe(category)
  end
  
  def get_user_recipe(category)
    puts "\nChoose a recipe to see the ingredient list (1-30)."
    recipe_input = gets.strip.to_i 
    if recipe_input.between?(1, 30)
      recipe = category.recipes[recipe_input - 1]
      recipe.find_ingredients
      puts "\n#{recipe.name} Ingredients:"
      recipe.ingredients.each do |ingredient|
        puts "#{ingredient}"
      end 
    else 
      puts "\nPlease enter a valid recipe number (1-30)."
      get_user_recipe(category)
    end
    instructions?(recipe)
  end
  
  def instructions?(recipe)
    puts "\nWould you like to see the instructions for making this recipe? (y/n)"
    answer = gets.strip 
    if answer == "y"
      recipe.find_instructions 
      puts "\n#{recipe.name} Instructions:"
      recipe.instructions.each.with_index(1) do |step, index|
        puts "#{index}. #{step}"
      end 
      check_in
    else 
      check_in
    end 
  end 
  
  def check_in 
    puts "\nAre you ready to head to the store for ingredients? \nIf you are finished, enter exit. Enter any key to continue viewing recipes." 
    @input = gets.strip 
  end 
  
  def goodbye
    puts "\nHappy cooking!"
  end 
end 