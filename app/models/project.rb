class Project < ApplicationRecord

  def self.form_options
    Project.all.map{|p| [p.name, p.id]}
  end

end
