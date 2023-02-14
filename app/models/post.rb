class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
  has_many :comments
  has_many :likes
  has_one_attached :header_image
end
