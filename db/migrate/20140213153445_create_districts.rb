class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :city_id
      t.integer :cep

      t.timestamps
    end
  end
end
