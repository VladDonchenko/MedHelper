class RenameTypeToTypeOfCall < ActiveRecord::Migration[6.1]
  def up
    rename_column :events, :type, :type_of_call
  end

  def down
    rename_column :tasks, :type_of_call, :type
  end
end
