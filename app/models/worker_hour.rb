class WorkerHour < ApplicationRecord

  belongs_to :project, optional: true
  belongs_to :worker, optional: true

  enum work_type: {
    gong: 0,
    area: 1
  }

  enum status: {
    unpaid: 0,
    paid: 1
  }

end
