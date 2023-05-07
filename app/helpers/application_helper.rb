# frozen_string_literal: true

module ApplicationHelper
  def checked(area)
    @user_account.job.nil? ? false : @user_account.job.match(area)
  end

  def icon(icon_class)
    content_tag(:i, '', class: icon_class)
  end

  def approved_job_count(user)
    user.job_navigations.where(is_approved: true).count
  end
end
