class CreateWebsiteBannerProperties < ActiveRecord::Migration
  def change
    create_table :website_banner_properties do |t|
      t.integer :property_id
      t.integer :position
      t.timestamps
    end
  end
end
