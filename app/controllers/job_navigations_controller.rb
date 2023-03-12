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
    @job_navigation = JobNavigation.all
  end

  def new
    @job_navigation = JobNavigation.new
  end

  def create
    @job_navigation = @current_user.job_navigations.new(job_navigation_params)
    if @job_navigation.save
      redirect_to dashboard_path, notice: 'Successfully created For Job Vacancy and waiting for approval of admin'
    else
      render :new, notice: 'Please Provide valid data'
    end
  end

  def destroy
    @job_navigation = JobNavigation.find(params[:id])
    @job_navigation.destroy
    redirect_to job_navigations_path, notice: 'Review has been deleted successfully', status: :see_other
  end

  def toggle_is_approved
    @job_navigation = JobNavigation.find(params[:id])
    @job_navigation.update(is_approved: true)
    redirect_to job_navigations_path, notice: 'The review is successfully approved'
  end

  def show
    @job_navigation = JobNavigation.find(params[:id])
  end

  def applied
    @job_navigation = JobNavigation.all
  end

  private

  def job_navigation_params
    params.require(:job_navigation).permit(:jobtitle, :jobdescription, :novac, :skill, :jobrole, :jobsector)
  end
end
