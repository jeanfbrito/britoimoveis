class Property < ActiveRecord::Base

  has_many :pictures
  belongs_to :district

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

end