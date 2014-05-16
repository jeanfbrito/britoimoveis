class AddStatsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :on_tablet, :boolean
    add_column :properties, :on_website, :boolean
  end
end
