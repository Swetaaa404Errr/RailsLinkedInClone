# frozen_string_literal: true

class JobField < ApplicationRecord
  validates :jobsection, presence: true, uniqueness: { scope: :jobsection }
end
