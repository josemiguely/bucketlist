class Bucket < ApplicationRecord
  include Notifications

  has_many :subscribers, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description
  validates :title, presence: true

  after_update_commit :notify_subscribers, if: :is_completed?
end
