# frozen_string_literal: true
# have categories
class Category < ApplicationRecord
  has_many :experts
end
