require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit recipes_url
    # save_and_open_screenshot
    assert_selector "h1", text: "Recipes"
    assert_selector ".index-card", count: Recipe.count
  end

  test "lets a signed in user create a new recipe and edit it" do
    login_as users(:one)
    visit "recipes/new"
    fill_in "recipe_name", with: "Testing recipe"
    fill_in "recipe_description", with: "Testing recipe"
    fill_in "recipe_doses_attributes_0_amount", with: 1
    within('#recipe_doses_attributes_0_unit') do
      select "dl", :from => @units
    end
    fill_in "recipe_doses_attributes_0_ingredient", with: "sugar"
    fill_in "recipe_steps_attributes_0_detail", with: "Step detail"
    fill_in "recipe_time", with: 45
    fill_in "recipe_portions", with: 6
    click_on 'Save'
    assert_text "Testing recipe"
    # save_and_open_screenshot
    click_on 'Edit recipe'
    fill_in "recipe_name", with: "Testing edit"
    fill_in "recipe_description", with: "Editing recipe"
    fill_in "recipe_doses_attributes_0_amount", with: 2
    within('#recipe_doses_attributes_0_unit') do
      select "tsp", :from => @units
    end
    fill_in "recipe_doses_attributes_0_ingredient", with: "flour"
    fill_in "recipe_steps_attributes_0_detail", with: "Edited detail"
    fill_in "recipe_time", with: 30
    fill_in "recipe_portions", with: 3
    click_on 'Save'
    assert_text "Testing Edit"
    # save_and_open_screenshot
  end
end