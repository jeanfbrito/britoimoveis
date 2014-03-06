class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|

      t.text    :description
      t.integer :property_id
      t.integer :order

      t.boolean :cover, :default => false
      t.boolean :mobile_catalog, :default => false
      t.boolean :website, :default => false

      t.string  :file_uid
      t.string  :file_name

      t.timestamps
    end
  end
end
