# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :expert
  belongs_to :user

  validates :body, presence: true
  validates_uniqueness_of :user_id, scope: :expert_id, on: :create
end
