class WorkerHour < ApplicationRecord

  belongs_to :project
  belongs_to :worker

  enum work_type: {
    gong: 0,
    area: 1
  }

  enum status: {
    unpaid: 0,
    paid: 1
  }
end
