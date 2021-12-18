class AddTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :type, :integer
  end
end
