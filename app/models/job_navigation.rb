# frozen_string_literal: true

class JobNavigation < ApplicationRecord
  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :reviews
  has_many :comment_posts
  has_many :likes
  has_many :notifies, dependent: :destroy

  has_many :user_accounts, through: :users
  validates :jobtitle, presence: true
  validates :jobdescription, presence: true
  validates :novac, presence: true, format: { with: /\d*[1-9]\d*/, message: 'must be a valid number' }
  validates :skill, presence: true
  validates :jobrole, presence: true
  validates :jobsector, presence: true
end
