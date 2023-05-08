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

  def similar_users(current_user)
    if current_user.user_accounts.exists?
      current_user_job = current_user.user_accounts.first.job.downcase.split(',').map(&:strip)
      current_user_skill = current_user.user_accounts.first.skill.downcase.split(',').map(&:strip)
      @matching_users = []
      User.joins(:user_accounts).where.not(id: current_user.id).distinct.each do |user|
        user_job = user.user_accounts.first.job.downcase.split(',').map(&:strip)
        user_skill = user.user_accounts.first.skill.downcase.split(',').map(&:strip)
        matching_job = current_user_job & user_job
        matching_skill = current_user_skill & user_skill
        @matching_users << user if matching_job.present? || matching_skill.present?
      end
    else
      current_user_job = []
      current_user_skill = []
      @matching_users = []
      # code to render a blank page
    end
  end

  def similar_jobs(current_user) 
    if current_user.user_accounts.exists?
      current_user_job = current_user.user_accounts.first.job.downcase.split(',').map(&:strip)
      current_user_skill = current_user.user_accounts.first.skill.downcase.split(',').map(&:strip)
      @matching_jobs = []
      JobNavigation.all.each do |job_navigation|
        @job_title = job_navigation.jobtitle.downcase.split(',').map(&:strip)
        @job_skill = job_navigation.skill.downcase.split(',').map(&:strip)
        matching_job = current_user_job & @job_title
        matching_skill = current_user_skill & @job_skill
        @matching_jobs << job_navigation if matching_job.present? || matching_skill.present?
      end
    else
      current_user_job = []
      current_user_skill = []
      @matching_jobs = []
      # code to render a blank page
    end
  end
end
