class MealPlanner
  
  def initialize
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



  #category_search: a function that allows users to search meals by category of BREAKFAST, LUNCH, DINNER, SNACK

  def category_search(category)

    matching_meals = []

    @meals.each do |meal|
      if meal[:category].downcase == category.downcase
        matching_meals.push(meal)
      end
    end

    #display the result
    display_search_results(matching_meals, "Category: #{category}")
  end



  #category function: allows users to search meals by ingredients

  def ingredients_search(ingredients)

    matching_meals = []

    @meals.each do |meal|
      if meal[:ingredients].downcase == ingredients.downcase
        matching_meals.push(meal)
      end
    end

    #display the result
    display_search_results(matching_meals, "Ingredients: #{ingredients.join(', ')}")
  end


  def display_search_results(meals, search_criteria)

    #check for stored meals in the array based on the search
    #if empty
    if meals.empty? 
      #display message
      puts "No Meals found with #{search_criteria}."
    else
      puts "Matching Meals with #{search_criteria}:"

      meals.each do |meal|
        puts "Category: #{meal[:category]}, Dish Name: #{meal[:dish_name]}, Ingredients: #{meal[:ingredients].join(', ')}"
      end
    end
  end
end

