class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  dragonfly_accessor :file

  belongs_to :property

  #attr_accessible :file_uid, :file_name, :file
   #one convenient method to pass jq_upload the necessary information
   
  def to_jq_upload
    {
      "name" => read_attribute(:file_name),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb('80x80#').url,
      "delete_url" => admin_picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end