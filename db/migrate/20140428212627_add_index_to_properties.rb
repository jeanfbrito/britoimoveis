class AddIndexToProperties < ActiveRecord::Migration
  def change
    add_index :properties, :sell_price
  end
end