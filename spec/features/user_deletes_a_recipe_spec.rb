require "rails_helper"

feature "user deletes a recipe spec" do
  scenario "successfully" do
    user = create(:user)
    recipe = create(:recipe, name: "old", user: user)

    visit root_path(as: user)

    within "#recipe_#{recipe.id}" do
      click_on "Delete"
    end

    expect(page).to_not have_css("#recipe_#{recipe.id}")
  end
end
