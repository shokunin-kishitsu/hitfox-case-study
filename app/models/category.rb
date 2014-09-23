class Category < ActiveRecord::Base

  has_many :monuments
  belongs_to :user

end
