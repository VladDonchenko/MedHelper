# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  has_many :protocols, dependent: :destroy
  has_one_attached :image

  validates :birthday, presence: true
  validates :full_name, presence: true, length: {maximum: 40}
end
