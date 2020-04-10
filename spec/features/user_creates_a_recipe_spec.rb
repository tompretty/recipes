require "rails_helper"

feature "user creates a recipe" do
  scenario "successfully" do
    user = create(:user)
    visit root_path(as: user)

    click_on "New Recipe"
    fill_in "Name", with: "My Recipe"
    fill_in "Url", with: "http://example.com"
    fill_in "Image Url", with: "http://example.com/image.jpg"
    click_on "Create"

    expect(page).to have_content("My Recipe")
    expect(page).to have_link(href: "http://example.com")
    expect(page).to have_css("img[src='http://example.com/image.jpg']")
  end
end
