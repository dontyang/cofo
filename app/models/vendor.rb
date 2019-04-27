class Vendor < ApplicationRecord

  def self.form_options
    Vendor.all.map{|p| [p.name, p.id]}
  end

end
