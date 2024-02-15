require 'minitest/autorun'
require_relative '../meal_planner'


class TestMealPlanner < Minitest::Test
  def setup
    @meal_planner = MealPlanner.new

  end


  #ADD MEAL TEST
  def test_add_meal
    @meal_planner.add_meal("Breakfast", "Hash-Pancakes", ["Potatoes", "Flour", "Eggs", "Cheese", "Butter", "Cilantro", "Onion", "Tomatoes"])
    assert_equal 1, @meal_planner.instance_variable_get(:@meals).length, "Meal was not added"
  end


  #DISPLAY MEALS TEST
  def test_list_meals
    @meal_planner.add_meal("Lunch", "Pesto Fettuccine", ["Pasta", "Pesto Sauce", "Parmesan", "Basil", "Cream"])
    @meal_planner.add_meal("Dinner", "Masala Curry", ["Bay Leaf", "Onion", "Cilantro", "Cloves", "Tumeric"])
    @meal_planner.add_meal("Snack", "Spicy Paneer Cubes", ["Paneer", "Ghee", "Cilantro"])


    output = StringIO.new
    $stdout = output

    @meal_planner.list_meals

    $stdout = STDOUT

    expected_output = "All Meals:\nCategory: Lunch\nDish Name: Pesto Fettuccine\nIngredients: Pasta, Pesto Sauce, Parmesan, Basil, Cream\nCategory: Dinner\nDish Name: Masala Curry\nIngredients: Bay Leaf, Onion, Cilantro, Cloves, Tumeric\nCategory: Snack\nDish Name: Spicy Paneer Cubes\nIngredients: Paneer, Ghee, Cilantro\n"

    assert_equal expected_output, output.string, "List Meals Failed :( )"
  end


  #CATEGORY SEARCH TEST
  def test_category_search
    @meal_planner.add_meal("Breakfast", "Omelette", ["Eggs", "Cheese", "Tomatoes", "Basil"])
    @meal_planner.add_meal("Lunch", "Burrito Supreme", ["Tomatoe", "Onion", "Beans", "Cilantro", "Cheese"])

    output = StringIO.new
    $stdout = output

    @meal_planner.category_search("breakfast")

    $stdout = STDOUT

    expected_output = "Matching Meals with Category: breakfast:\nCategory: Breakfast, Dish Name: Omelette, Ingredients: Eggs, Cheese, Tomatoes, Basil\n"
    assert_equal expected_output, output.string


  end

  #INGREDIENTS SEARCH TEST
  def test_ingredients_search

    @meal_planner.add_meal("Breakfast", "Egg Taco", ["Eggs", "Cheese", "Basil"])
    @meal_planner.add_meal("Dinner", "Fried Rice", ["Tomatoe", "Onion", "Cilantro"])

    output = StringIO.new
    $stdout = output

    @meal_planner.ingredients_search(["tomatoe", "onion"])

    $stdout = STDOUT

    expected_output = "Matching Meals with Ingredients: tomatoe, onion:\nCategory: Dinner, Dish Name: Fried Rice, Ingredients: Tomatoe, Onion, Cilantro\n"
    assert_equal expected_output, output.string
  end
  
end
