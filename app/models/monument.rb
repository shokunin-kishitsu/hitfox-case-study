class Monument < ActiveRecord::Base

  has_many :pictures, dependent: :delete_all
  belongs_to :category
  belongs_to :collection

end
