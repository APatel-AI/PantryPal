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
  

end
