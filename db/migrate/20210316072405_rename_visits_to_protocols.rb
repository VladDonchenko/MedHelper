class RenameVisitsToProtocols < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :visits, :protocols
  end

  def self.down
    rename_table :protocols, :visits
  end
end
