class Monument < ActiveRecord::Base

  has_many :pictures
  belongs_to :category
  belongs_to :collection

end
