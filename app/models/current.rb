# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :admin
  attribute :job_position
end
