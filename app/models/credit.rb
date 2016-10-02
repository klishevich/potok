class Credit < ApplicationRecord
  belongs_to :client
  has_many :credit_payments
end
