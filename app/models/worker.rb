class Worker < ApplicationRecord

  mount_uploader :idcard_front_image, ::FileUploader
  mount_uploader :idcard_back_image, ::FileUploader

  has_many :worker_hours
  has_many :worker_advances
  has_many :worker_settles

  def self.form_options
    Worker.all.map{|w| [w.name, w.id]}
  end
end
