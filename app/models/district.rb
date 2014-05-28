class District < ActiveRecord::Base

  belongs_to :city
  has_many :properties

  scope :used, -> do
    all.select{ |x| x.has_proprieties? }
  end

  def has_proprieties?
    properties.any?
  end

end