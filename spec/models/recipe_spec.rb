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
end
