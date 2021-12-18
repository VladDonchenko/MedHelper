class AddRecommendationToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :recommendation, :boolean
  end
end
