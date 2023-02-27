# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!

  def create
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @review = @job_navigation.reviews.create(review_params)
    redirect_to job_navigation_path(@job_navigation), notice: 'comment saved'
  end

  def show
    @reviews = Review.all
  end

  def destroy
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @review = @job_navigation.reviews.find(params[:id])
    @review.destroy
    redirect_to job_navigation_path(@job_navigation), notice: 'Review has been deleted successfully', status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :body)
  end
end
