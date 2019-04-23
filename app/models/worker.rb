class Worker < ApplicationRecord

  mount_uploader :idcard_front_image, ::FileUploader
  mount_uploader :idcard_back_image, ::FileUploader

  def self.form_options
    Worker.all.map{|w| [w.name, w.id]}
  end
end
