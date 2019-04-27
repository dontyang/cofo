class Material < ApplicationRecord

  belongs_to :vendor, optional: true
  belongs_to :project, optional: true

  enum status: {
    unpaid: 0,
    paid: 1
  }

end
