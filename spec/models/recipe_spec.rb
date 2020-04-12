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

  describe ".filter_by_name" do
    it "returns the recipes with the given name" do
      user = create(:user)
      create(:recipe, name: "yes1", user: user)
      create(:recipe, name: "yes2", user: user)
      create(:recipe, name: "no", user: user)

      result = user.recipes.filter_by_name("yes").map(&:name)

      expect(result).to eq(["yes1", "yes2"])
    end

    it "is case insensitive" do
      user = create(:user)
      create(:recipe, name: "YES", user: user)

      result = user.recipes.filter_by_name("yes").map(&:name)

      expect(result).to eq(["YES"])
    end
  end
end
