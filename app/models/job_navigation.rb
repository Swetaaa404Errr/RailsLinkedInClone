# frozen_string_literal: true

class JobNavigation < ApplicationRecord
  belongs_to :user

  has_many :applies, dependent: :destroy
  has_many :reviews
  has_many :comment_posts

  has_many :likes
  has_many :user_accounts, through: :users

  validates :jobtitle, presence: true
  validates :jobdescription, presence: true
  validates :novac, presence: true
  validates :skill, presence: true

  validates :jobrole, presence: true

  validates :jobsector, presence: true
end
