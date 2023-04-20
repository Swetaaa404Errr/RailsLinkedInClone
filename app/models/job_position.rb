# frozen_string_literal: true

class JobPosition < ApplicationRecord
  validates :jobdesignation, presence: true,
                             uniqueness: { scope: :jobdesignation, message: 'This Job Role is already present' }
end
