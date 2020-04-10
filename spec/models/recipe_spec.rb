require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:image_url) }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe ".filter_by_tag" do
    it "returns the recipes with the given tag" do
      user = create(:user)
      create(:recipe, name: "tagged1", tag_list: "tag", user: user)
      create(:recipe, name: "tagged2", tag_list: "tag", user: user)
      create(:recipe, name: "untagged", user: user)

      result = user.recipes.filter_by_tag("tag").map(&:name)

      expect(result).to eq(["tagged1", "tagged2"])
    end
  end
end
