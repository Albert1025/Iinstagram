class AddCoordinatesToPics < ActiveRecord::Migration[5.1]
  def change
    add_column :pics, :latitude, :float
    add_column :pics, :longitude, :float
  end
end
