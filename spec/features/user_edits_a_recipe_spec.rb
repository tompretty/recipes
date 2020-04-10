require "rails_helper"

feature "user edits a recipe spec" do
  scenario "successfully" do
    user = create(:user)
    recipe = create(:recipe, name: "old", user: user)

    visit root_path(as: user)

    within "#recipe_#{recipe.id}" do
      click_on "Edit"
    end

    fill_in "Name", with: "new"
    click_on "Update Recipe"

    within "#recipe_#{recipe.id}" do
      expect(page).to have_content("new")
    end
  end

  scenario "unsuccessfully" do
    user = create(:user)
    recipe = create(:recipe, name: "old", user: user)

    visit root_path(as: user)

    within "#recipe_#{recipe.id}" do
      click_on "Edit"
    end

    fill_in "Name", with: ""
    click_on "Update Recipe"

    expect(page).to have_content("Name can't be blank")
  end
end
