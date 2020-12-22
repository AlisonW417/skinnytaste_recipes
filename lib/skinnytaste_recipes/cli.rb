class SkinnytasteRecipes::CLI 
  def call 
    puts "Welcome to the Skinnytaste Recipe Selector!"
    display_categories
  end 
  
  def display_categories 
    puts "Please choose a recipe category. \nEnter the number for the category you'd like to view (1-14):"
    SkinnytasteRecipes::Scraper.get_categories
    # move this to category class later
  end 
end 