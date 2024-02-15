class MealPlanner
  
  def initalize
    # holder
    @meals = [] 
  end

  #add meal function: users can add meals to the list based on Category, Dish Name and Ingredients
  def add_meal = (category, dish_name, ingredients)
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
