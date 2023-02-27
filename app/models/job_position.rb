# frozen_string_literal: true

class JobPosition < ApplicationRecord
  validates :jobdesignation, presence: true
end
