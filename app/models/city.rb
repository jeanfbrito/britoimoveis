class City < ActiveRecord::Base

  has_many :districts
  belongs_to :state

  has_many :properties, through: :districts


end