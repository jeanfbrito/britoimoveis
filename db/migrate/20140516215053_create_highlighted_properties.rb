class CreateHighlightedProperties < ActiveRecord::Migration
  def change
    create_table :highlighted_properties do |t|
      t.integer :property_id
      t.integer :position
      t.timestamps
    end
  end
end
