# frozen_string_literal: true

class JobNavigationsController < ApplicationController
  before_action :set_current_user
  before_action :set_current_job, only: %i[feed]
  before_action :require_user_logged_in!, only: %i[show]
  before_action :require_admin, only: %i[destroy toggle_is_approved]
  def index
    @job_navigation = JobNavigation.all
  end

  def feed
    if @current_user.user_accounts.exists?
      @current_user_job = @current_user.user_accounts.first.job.split(',').map(&:strip)
      @current_user_skill = @current_user.user_accounts.first.skill.split(',').map(&:strip)
      @matching_jobs = []
      JobNavigation.all.each do |job_navigation|
        @job_title = job_navigation.jobtitle.split(',').map(&:strip)
        @job_skill = job_navigation.skill.split(',').map(&:strip)
        matching_job = @current_user_job & @job_title
        matching_skill = @current_user_skill & @job_skill
        @matching_jobs << job_navigation if matching_job.present? || matching_skill.present?
      end
    else
      current_user_job = []
      current_user_skill = []
      @matching_jobs = []
      # code to render a blank page
    end
  end

  def new
    @job_navigation = JobNavigation.new
  end

  def create
    @job_navigation = @current_user.job_navigations.new(job_navigation_params)
    if @job_navigation.save
      redirect_to posts_path, notice: 'Successfully created For Job Vacancy and waiting for approval of admin'
    else
      flash.discard
      render :new
    end
  end

  def destroy
    @job_navigation = JobNavigation.find(params[:id])
    @job_navigation.destroy
    redirect_to job_navigations_path, notice: 'Job has been Deleted', status: :see_other
  end

  def toggle_is_approved
    @job_navigation = JobNavigation.find(params[:id])

    @job_navigation.update(is_approved: true)

    @current_job = @job_navigation.jobtitle.downcase.split(',').map(&:strip)
    @current_skill = @job_navigation.skill.downcase.split(',').map(&:strip)
    @matching_users = []
    User.joins(:user_accounts).where.not(id: @current_user.id).distinct.each do |user|
      @user_job = user.user_accounts.first.job.downcase.split(',').map(&:strip)
      @user_skill = user.user_accounts.first.skill.downcase.split(',').map(&:strip)
      matching_job = @current_job & @user_job
      matching_skill = @current_skill & @user_skill
      next unless matching_job.present? || matching_skill.present?

      @matching_users << user
      @matching_users.each do |user|
        notify = Notify.create(
          user_id: user.id,
          job_navigation_id: @job_navigation.id,
          job_name: @job_navigation.jobtitle
        )

        JobnotifyMailer.job_notification(user, @current_job).deliver_later
      end
    end

    redirect_to job_navigations_path,
                notice: 'The Job is approved and an email has been sent to interested users'
  end

  def show
    @job_navigation = JobNavigation.find(params[:id])
    @review = Review.new
    @apply = Apply.new
  end

  def edit
    @job_navigation = JobNavigation.find(params[:id])
  end

  def update
    @job_navigation = JobNavigation.find(params[:id])
    if @job_navigation.update(job_navigation_params)

      redirect_to posts_path, notice: 'Successfully updated Job Post'
    else

      render :edit
    end
  end

  def applied
    @job_navigation = JobNavigation.all
  end

  def posts; end

  private

  def job_navigation_params
    params.require(:job_navigation).permit(:jobtitle, :jobdescription, :vacancy, :skill, :jobrole, :jobsector)
  end
end
