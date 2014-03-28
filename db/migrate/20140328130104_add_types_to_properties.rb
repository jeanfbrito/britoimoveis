class AddTypesToProperties < ActiveRecord::Migration
  def change
    # Address informations
    add_column :properties, :property_type_id, :integer    
    add_column :properties, :business_type_id, :integer
  end
end
