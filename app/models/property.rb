class Property < ActiveRecord::Base

  has_many :pictures, -> { order("position ASC") }
  belongs_to :district
  belongs_to :property_type
  belongs_to :business_type

  validates :district, :property_type, :business_type, presence: true

  scope :id, -> (id) { where id: id }
  scope :district_id, -> (district_id) { where district_id: district_id }
  scope :bedrooms, -> (bedrooms) { where bedrooms: bedrooms }
  scope :garages, -> (garages) { where garages: garages }
  scope :property_type_id, -> (property_type_id) { where property_type_id: property_type_id }

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

  # def self.search_code(id)
  #   where("id like ?", "%#{id}%") 
  # end

  # def self.search(district_id_p, bedrooms_p, garages_p, property_type_id_p) 
  #   where do
  #     [
  #       district_id_p.presence && properties.district_id == "#{district_id_p}",
  #       bedrooms_p.presence && properties.bedrooms == "%#{bedrooms_p}",
  #       garages_p.presence && properties.garages == "#{garages_p}",
  #       property_type_id_p.presence && properties.property_type_id == "#{property_type_id_p}"
  #     ].compact.reduce(:&)
  #     # compact to remove the nils, reduce to combine the cases with |
  #   end

    
  #   #binding.pry
  # end

end

