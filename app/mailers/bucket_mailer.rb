class BucketMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bucket_mailer.is_completed.subject
  #
  def is_completed
    @bucket = params[:bucket]
    puts "bucket que tengooo #{@bucket.title}"
    mail to: params[:subscriber].email
  end
end
