# frozen_string_literal: true

class UserAccount < ApplicationRecord
  belongs_to :user
  has_many_attached :certificate
  has_one_attached :picture
  has_one_attached :cv
  validates :username, allow_blank: true, length: { minimum: 3, maximum: 50 }
  validates :gmail, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
  validates :job, presence: true
  validates :link, allow_blank: true, format: %r{\Ahttp(s)://.*?\.linkedin\.com/}
  validates :picture, allow_blank: true, attached: true, content_type: %i[png jpg jpeg]
  validates :certificate, allow_blank: true, attached: true, content_type: %i[png jpg jpeg]
  validates :cv, allow_blank: true, attached: true, content_type: [:pdf]

  before_save do
    job.gsub!(/[\[\]"]/, '') if attribute_present?('job')
  end

  def thumbnail
    image.variant(resize: '100*100')
  end
end
