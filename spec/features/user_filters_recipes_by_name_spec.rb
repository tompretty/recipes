require "rails_helper"

feature "user filters recipes by name" do
  scenario "successfully" do
    user = create(:user)
    searched = create(:recipe, name: "yes", user: user)
    not_searched = create(:recipe, name: "no", user: user)

    visit root_path(as: user)

    within "#search" do
      fill_in "name", with: "yes"
      click_on "Search"
    end

    expect(page).to have_css("#recipe_#{searched.id}")
    expect(page).to_not have_css("#recipe_#{not_searched.id}")
  end
end
