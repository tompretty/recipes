require "rails_helper"

feature "user creates a recipe" do
  scenario "successfully" do
    user = create(:user)
    visit root_path(as: user)

    click_on "New Recipe"
    fill_in "Name", with: "My Recipe"
    fill_in "Url", with: "http://example.com"
    fill_in "Image Url", with: "http://example.com/image.jpg"
    fill_in "Tags", with: "tag1, tag2"
    click_on "Create"

    expect(page).to have_content("My Recipe")
    expect(page).to have_link(href: "http://example.com")
    expect(page).to have_css("img[src='http://example.com/image.jpg']")
    expect(page).to have_content("tag1")
    expect(page).to have_content("tag2")
  end
end
