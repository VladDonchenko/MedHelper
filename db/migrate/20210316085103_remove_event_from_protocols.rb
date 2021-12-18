class RemoveEventFromProtocols < ActiveRecord::Migration[6.1]
  def change
    remove_reference :protocols, :event, null: false, foreign_key: true
  end
end
