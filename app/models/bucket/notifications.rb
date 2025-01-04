module Bucket::Notifications
  extend ActiveSupport::Concern

  included do
    has_many :subscribers, dependent: :destroy
    after_update_commit :notify_subscribers, if: :is_completed?
  end

  def is_completed?
    is_completed_previously_was === false && is_completed === true
  end

  def notify_subscribers
    subscribers.each do |subscriber|
      BucketMailer.with(bucket: self, subscriber: subscriber).is_completed.deliver_later
    end
  end
end
