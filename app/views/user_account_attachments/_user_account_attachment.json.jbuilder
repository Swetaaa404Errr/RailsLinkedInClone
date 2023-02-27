# frozen_string_literal: true

json.extract! user_account_attachment, :id, :user_account_id, :certificate, :created_at, :updated_at
json.url user_account_attachment_url(user_account_attachment, format: :json)
