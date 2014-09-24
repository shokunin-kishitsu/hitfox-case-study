class Collection < ActiveRecord::Base

  belongs_to :user
  has_many :monuments, dependent: :delete_all

end
