class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_payment: 0, confirmation_payment: 1, in_production: 2, preparing_shipping: 3, already_shipped:4 }
end
