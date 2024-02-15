class MealPlanner
  
  def initalize
    # holder
    @meals = [] 
  end

  #add meal function: users can add meals to the list based on Category, Dish Name and Ingredients
  def add_meal (category, dish_name, ingredients)
    meal = {
      :category => category,
      :dish_name => dish_name, 
      :ingredients => ingredients
    }
    # meal to meals array
    @meals.push(meal)

    #display success message to screen 
    puts "🍽 added successfully !"
  end


  #list meals: displays all of the meals from the data to the terminal
  def list_meals
    #display message
    puts "All Meals:"

    @meals.each do |meal|
      puts "Category: #{meal[:category]}, Dish Name: #{meal[:dish_name]}, Ingredients: #{meal[:ingredients].join(', ')}"
    end
  end
end