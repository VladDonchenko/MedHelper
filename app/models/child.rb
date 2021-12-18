# frozen_string_literal: true

class Child < ApplicationRecord
  belongs_to :user
  has_one :vaccine, dependent: :destroy

  validates :birthday, presence: true
  validates :name, presence: true, length: {maximum: 20}
end
