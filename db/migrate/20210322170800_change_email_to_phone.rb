class ChangeEmailToPhone < ActiveRecord::Migration[6.1]
  def change
    rename_column :cards, :email, :phone
  end
end
