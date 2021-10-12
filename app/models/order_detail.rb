class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  
  enum making_status: { not_available: 0, waiting_production: 1, in_production: 2, production_complete: 3 }
end
