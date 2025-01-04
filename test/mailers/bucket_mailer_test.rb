require "test_helper"

class BucketMailerTest < ActionMailer::TestCase
  test "is_completed" do
    mail = BucketMailer.is_completed
    assert_equal "Is completed", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
