require "rails_helper"

RSpec.describe "recipes/_tag.html.erb" do
  it "displays the number of tagged recipes" do
    user = create(:user)
    create(:recipe, tag_list: ["tag"], user: user)
    create(:recipe, tag_list: ["tag"], user: user)

    tag = user.recipes.tag_counts[0]

    render partial: "recipes/tag", locals: { tag: tag }

    expect(rendered).to have_content("2")
  end
end
