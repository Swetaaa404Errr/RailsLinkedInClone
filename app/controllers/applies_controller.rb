# frozen_string_literal: true

class AppliesController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!
  before_action :find_post

  def create
    @apply = @job_navigation.applies.create(apply_params)
    return unless @apply.save

    flash[:notice] = 'Successfully Applied'

    author = @apply.job_navigation.user.email

    file = @apply.cv
    ApplyjobMailer.new_applyjob(author, file).deliver_now
  end

  private

  def apply_params
    params.require(:apply).permit(:cv).merge(user_id: @current_user.id)
  end

  def find_post
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
  end

  def already_applied?
    Apply.where(user_id: @current_user.id, job_navigation_id: params[:job_navigation_id]).exists?
  end

  def find_apply
    @apply = @job_navigation.applies.find(params[:id])
  end
end
