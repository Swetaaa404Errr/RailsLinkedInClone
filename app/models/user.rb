# frozen_string_literal: true

class User < ApplicationRecord
  has_many :job_navigations, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :user_accounts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :applies, dependent: :destroy
  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
  validates :username, presence: true,
                       length: { minimum: 3, maximum: 50 }
  scope :all_except, ->(user) { where.not(id: user) }
  followability
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
