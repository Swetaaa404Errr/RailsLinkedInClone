# frozen_string_literal: true

class AppliesController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!
  before_action :find_post

  def create
    @apply = @job_navigation.applies.new(apply_params)
    if @apply.save

      flash[:notice] = 'Successfully Applied'

      author = @apply.job_navigation.user.email

      file = @apply.cv
      ApplyjobMailer.new_applyjob(author, file).deliver_now

    else
      render 'job_navigations/show', locals: { apply: @apply }
    end
  end

  private

  def apply_params
    if params[:apply].present?
      params.require(:apply).permit(:cv).merge(user_id: @current_user.id)
    else
      {}
    end
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
