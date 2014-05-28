class PropertyType < ActiveRecord::Base

  has_many :properties

  scope :used, -> do
    all.select{ |x| x.has_proprieties? }
  end

  def has_proprieties?
    properties.published.any?
  end

end