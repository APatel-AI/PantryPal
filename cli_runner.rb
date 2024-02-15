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
  


end
