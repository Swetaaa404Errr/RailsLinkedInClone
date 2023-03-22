# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_current_user
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = 'You cant like more than once'
    else
      @job_navigation.likes.create(user_id: @current_user.id)
    end
    redirect_to request.referer
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'can not unlike'
    else
      @like.destroy
    end
    redirect_to request.referer
  end

  private

  def find_post
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
  end

  def already_liked?
    Like.where(user_id: @current_user.id, job_navigation_id: params[:job_navigation_id]).exists?
  end

  def find_like
    @like = @job_navigation.likes.find(params[:id])
  end
end
