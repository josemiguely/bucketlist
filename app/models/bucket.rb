class Bucket < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :description
  validates :title, presence: true
end
