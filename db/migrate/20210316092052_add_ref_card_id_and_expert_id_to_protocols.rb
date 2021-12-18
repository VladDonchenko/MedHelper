class AddRefCardIdAndExpertIdToProtocols < ActiveRecord::Migration[6.1]
  def change
    add_reference :protocols, :card, null: false, foreign_key: true
    add_reference :protocols, :expert, null: false, foreign_key: true
  end
end
