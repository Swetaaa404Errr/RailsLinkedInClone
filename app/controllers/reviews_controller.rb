# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_current_user
  before_action :require_user_logged_in!

  def create
    @job_navigation = JobNavigation.find(params[:job_navigation_id])
    @review = @job_navigation.reviews.new(review_params)

    if @review.save
      redirect_to job_navigation_path(@job_navigation), notice: 'comment saved'

    else

      render 'job_navigations/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :body)
  end
end
