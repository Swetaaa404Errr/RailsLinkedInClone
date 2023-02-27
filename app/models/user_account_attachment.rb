# frozen_string_literal: true

class UserAccountAttachment < ApplicationRecord
  mount_uploader :certificate, CertificateUploader
  belongs_to :user_account
end
