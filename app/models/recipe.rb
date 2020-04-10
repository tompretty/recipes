class Recipe < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :url, :image_url

  acts_as_taggable

  def self.filter_by_tag(tag)
    tagged_with(tag)
  end
end
