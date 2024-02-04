class RemoveUbicacionFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :longitud, :float
    remove_column :events, :latitud, :float
  end
end
