# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :expert
  belongs_to :user
  validates :start_time, :end_time, :comment, presence: true
  validates :comment, length: { maximum: 256 }
  enum type_of_call: { offline: 0, online: 1 }
  enum status: { pending: 0, approve: 1, rejected: 2 }
end
