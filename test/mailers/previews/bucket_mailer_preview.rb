# Preview all emails at http://localhost:3000/rails/mailers/bucket_mailer
class BucketMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/bucket_mailer/is_completed
  def is_completed
    BucketMailer.is_completed
  end
end
