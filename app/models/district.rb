class District < ActiveRecord::Base

  belongs_to :city
  has_many :properties

end