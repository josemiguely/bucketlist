class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end

  def show
    @bucket = Bucket.find(params[:id])
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)
    if @bucket.save
      redirect_to @bucket
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def bucket_params
    params.expect(bucket: [ :title, :description ])
  end
end
