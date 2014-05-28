class City < ActiveRecord::Base

  has_many :districts
  belongs_to :state

  has_many :properties, through: :districts

  scope :used, -> do
    all.select{ |x| x.has_proprieties? }
  end

  def has_proprieties?
    properties.published.any?
  end


end