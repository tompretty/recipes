class Recipe < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :url, :image_url

  acts_as_taggable
end
