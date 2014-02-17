class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text    :description
      t.integer :value

      t.timestamps
    end
  end
end
