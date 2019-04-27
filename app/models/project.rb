class Project < ApplicationRecord

  has_many :worker_hours
  has_many :materials

  def self.form_options
    Project.all.map{|p| [p.name, p.id]}
  end

end
