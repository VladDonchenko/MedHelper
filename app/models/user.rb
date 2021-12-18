# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :experts, through: :events
  has_many :children, dependent: :destroy
  has_one :vaccine, dependent: :destroy
  has_one :expert, dependent: :destroy
  has_one :card, dependent: :destroy

  enum role: %i[patient doctor]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      name: access_token.info.name,
      email: data['email'],
      image: access_token.info.image,
      password: SecureRandom.hex(8))
    user
  end
end
