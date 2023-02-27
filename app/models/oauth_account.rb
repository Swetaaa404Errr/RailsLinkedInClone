# frozen_string_literal: true

class OauthAccount < ApplicationRecord
  belongs_to :user
end
