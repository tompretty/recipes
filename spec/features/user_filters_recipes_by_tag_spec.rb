require "rails_helper"

feature "user filters recipes by tag" do
  scenario "successfully" do
    user = create(:user)
    tagged = create(:recipe, tag_list: "tagged", user: user)
    untagged = create(:recipe, user: user)

    visit root_path(as: user)

    within "#tags" do
      click_on "tagged"
    end
    
    expect(page).to have_css("#recipe_#{tagged.id}")
    expect(page).to_not have_css("#recipe_#{untagged.id}")
  end
end
