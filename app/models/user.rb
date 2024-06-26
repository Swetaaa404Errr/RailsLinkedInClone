# frozen_string_literal: true

class User < ApplicationRecord
  has_many :job_navigations, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :user_accounts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :notifies, dependent: :destroy

  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
  validates :username, presence: true,
                       length: { minimum: 3, maximum: 50 }
  validates :password, format: { with: %r{\A(?=.*[!@#$%^&*()\-_=+{};:,<.>‌​~\[\]|\\/])(?=.*\d).*\z},
                                 message: 'must include at least one special character and one number' },
                       length: { minimum: 4, message: 'must be at least 4 characters long' }

  scope :all_except, ->(user) { where.not(id: user) }
  scope :latest_first, -> { order(created_at: :desc) }

  attr_accessor :linkedin_uid, :linkedin_token, :linkedin_token_expiry

  def self.from_omniauth(auth)
    if auth.provider == 'linkedin'
      user = where(linkedin_uid: auth.uid).first_or_initialize
      user.linkedin_token = auth.credentials.token
      user.linkedin_token_expiry = Time.at(auth.credentials.expires_at)
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = 'default_password0@'

      user.save!
    end

    user
  end

  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
