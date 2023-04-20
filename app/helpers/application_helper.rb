# frozen_string_literal: true

module ApplicationHelper
  def checked(area)
    @user_account.job.nil? ? false : @user_account.job.match(area)
  end
end
