class Bucket < ApplicationRecord
  has_many :subscribers, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description
  validates :title, presence: true

  after_update_commit :notify_subscribers, if: :is_completed?

  def is_completed?
    is_completed_previously_was === false && is_completed === true
  end

  def notify_subscribers
    subscribers.each do |subscriber|
      BucketMailer.with(bucket: self, subscriber: subscriber).is_completed.deliver_later
    end
  end
end
