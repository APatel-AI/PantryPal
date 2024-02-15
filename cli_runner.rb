require_relative 'meal_planner'
class CLIRunner
  def initialize
    @meal_planner = MealPlanner.new
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i

      case choice

      when 1
        add_meal_prompt
      when 2
        list_meals_prompt
      when 3
        search_by_category_prompt
      when 4
        search_by_ingredients_prompt
      when 5
        break
      else
        puts "Invalid Choice. Try Again"
      end
    end
  end
  

  #display the menu

  def display_menu
    puts "Menu: ☕️"
    puts "1. Add Meal to Pantry: "
    puts "2. View all saved meals: "
    puts "3. Search Meals by Category (Breakfast/Lunch/Dinner/Snack: )"
    puts "4. Search Meals by Ingredients (eg. tomatoe, lettuce): "
    puts "5. Exit Menu"
    puts "Enter you choice: "
  end


  #add meal function (prompts)
  def add_meal_prompt
    #category
    puts "Enter Category (Breakfast, Lunch, Dinner, Snack): "
    category = gets.chomp

    #meal name
    pp "Enter Dish Name: "
    dish_name = gets.chomp

    #ingredients 
    pp "Enter Ingredients (separate with comma): "

    
    ingredients = gets.chomp.split(',').map{|ingredient| ingredient.chomp.strip}

    #add to meal planner
    @meal_planner.add_meal(category, dish_name, ingredients)

  end


  #display all saved meals
  def list_meals_prompt
    @meal_planner.list_meals
  end


  #Enter Category prompt
  def search_by_category_prompt
    pp "Enter Category: "
    category = gets.chomp
    @meal_planner.category_search(category)
  end


  #search by ingredients 

  def search_by_ingredients_prompt
    pp "Enter Ingredients (comma-separated): "
    ingredients = gets.chomp.split(',').map{|ingredient| ingredient.chomp.strip}

    @meal_planner.ingredients_search(ingredients)

  end


end
