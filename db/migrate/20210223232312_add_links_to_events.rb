class AddLinksToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :calendar_link, :string
    add_column :events, :meeting_link, :string
  end
end
