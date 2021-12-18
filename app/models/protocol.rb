# frozen_string_literal: true

class Protocol < ApplicationRecord
  belongs_to :card
  belongs_to :expert

  enum type_of_inspection: { first_visit: 0, second_visit: 1 }

  validates :type_of_inspection, :diagnosis, presence: true
end
