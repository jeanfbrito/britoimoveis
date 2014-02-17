class AddDetailsToProperties < ActiveRecord::Migration
  def change
    # Address informations
    add_column :properties, :address_name, :string
    add_column :properties, :address_number, :string
    add_column :properties, :address_complement, :string
    add_column :properties, :address_reference, :text
    add_column :properties, :district_id, :integer

    # Measure informations
    add_column :properties, :privative_area, :integer
    add_column :properties, :constructed_area, :integer
    add_column :properties, :total_area, :integer
    add_column :properties, :terrain_area, :integer

    # Value informations
    add_column :properties, :sell_price, :integer
    add_column :properties, :client_price, :integer

    # Indoor informations
    add_column :properties, :bedrooms, :integer
    add_column :properties, :bathrooms, :integer
    add_column :properties, :suits, :integer
    add_column :properties, :construction_year, :integer
    add_column :properties, :garages, :integer
    add_column :properties, :furnished, :boolean

  end
end
