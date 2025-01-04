class SubscribersController < ApplicationController
  allow_unauthenticated_access
  before_action :set_bucket

  def create
    @bucket.subscribers.where(subscriber_params).first_or_create
    redirect_to @bucket, notice: "You are now subscribed."
  end

  private

  def set_bucket
    @bucket = bucket.find(params[:bucket_id])
  end

  def subscriber_params
    params.expect(subscriber: [ :email ])
  end
end
