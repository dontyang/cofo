class WorkerSettle < ApplicationRecord
  has_many :worker_hours
  has_many :worker_advances
  belongs_to :worker
end
