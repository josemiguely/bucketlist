class Subscriber < ApplicationRecord
  belongs_to :bucket
  generates_token_for :unsubscribe
end
