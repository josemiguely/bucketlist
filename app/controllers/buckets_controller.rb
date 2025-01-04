class BucketsController < ApplicationController
  before_action :set_bucket, only: %i[ show edit update destroy]

  def index
    @buckets = Bucket.all
  end

  def show
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

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to @bucket
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @bucket.destroy
    redirect_to buckets_path, notice: "Bucket was succesfully deleted"
  end
  private
  def set_bucket
    @bucket = Bucket.find(params[:id])
  end

  def bucket_params
    params.expect(bucket: [ :title, :description,  :featured_image ])
  end
end
