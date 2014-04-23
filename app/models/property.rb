class Property < ActiveRecord::Base

  has_many :pictures, -> { order("position ASC") }
  belongs_to :district
  belongs_to :property_type
  belongs_to :business_type

  validates :district, :property_type, :business_type, presence: true

  after_initialize do
    if self.new_record?
      # values will be available for new record forms.
      self.bedrooms = 0 
      self.bathrooms = 0
      self.suits = 0
      self.garages = 0
    end
  end

  def get_cover
  	#cover = pictures.where(property_id: id, cover: true).first
    cover = pictures.where(property_id: id).first #just to dev tests
    if cover
      return cover
    end
    false
  end

  def has_value?(field_name)
    return true if send(field_name).present? && send(field_name) > 0
    false
  end

  def self.search(query)
    where("id like ?", "%#{query}%") 
  end

end

