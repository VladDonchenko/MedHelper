# frozen_string_literal: true

class Vaccine < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :child, optional: true
end
