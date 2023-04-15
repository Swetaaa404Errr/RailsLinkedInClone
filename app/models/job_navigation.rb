# frozen_string_literal: true

class JobNavigation < ApplicationRecord
  belongs_to :user
  has_many :applies, dependent: :destroy
  has_many :reviews
  has_many :likes
  has_many :notifies, dependent: :destroy

  has_many :user_accounts, through: :users
  validates :jobtitle, presence: true
  validates :vacancy, presence: true, format: { with: /\d*[1-9]\d*/, message: 'must be a valid number' }
end
