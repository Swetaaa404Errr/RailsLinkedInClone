# frozen_string_literal: true

class UserAccount < ApplicationRecord
  belongs_to :user
  has_many :job_navigations, through: :users
  has_many_attached :certificate
  has_one_attached :picture
  has_one_attached :cv

  has_many :user_account_attachments
  accepts_nested_attributes_for :user_account_attachments
  validates :username, presence: true
  validates :gmail, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
  validates :skiill, presence: true
  validates :orgganisation, presence: true
  validates :job, presence: true
  validates :link, allow_blank: true, format: %r{\Ahttp(s)://.*?\.linkedin\.com/}
  validates :picture, allow_blank: true, attached: true, content_type: %i[png jpg jpeg]
  validates :cv, attached: true, content_type: [:pdf]

  before_save do 
    job.gsub!(/[\[\]"]/, '') if attribute_present?('job')
  end
end
