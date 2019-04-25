class WorkerAdvance < ApplicationRecord

  belongs_to :worker, optional: true
  belongs_to :employee, optional: true

  enum status: {
    unpaid: 0,
    paid: 1
  }

end
