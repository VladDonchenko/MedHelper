class AddLongitudeAndLatitudeToExperts < ActiveRecord::Migration[6.1]
  def change
    add_column :experts, :latitude, :float
    add_column :experts, :longitude, :float
  end
end
