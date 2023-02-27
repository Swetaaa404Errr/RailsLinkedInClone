# frozen_string_literal: true

class JobPositionsController < ApplicationController
  before_action :require_admin

  def job; end

  def List; end

  def index
    @job_position = JobPosition.all
  end

  def new
    @job_position = JobPosition.new
  end

  def create
    @job_position = JobPosition.new(job_position_params)

    if @job_position.save
      redirect_to job_position_path(@job_position), notice: 'Successfully added a jobrole'
    else
      render :new, notice: 'Please Provide valid data'
    end
  end

  def show
    @job_position = JobPosition.find(params[:id])
  end

  def edit
    @job_position = JobPosition.find(params[:id])
  end

  def update
    @job_position = JobPosition.find(params[:id])
    if @job_position.update(job_position_params)

      redirect_to jobadd_path, notice: 'Successfully updated jobrole'
    else

      render :edit
    end
  end

  def destroy
    @job_position = JobPosition.find(params[:id])
    if @job_position.destroy
      redirect_to jobadd_path, notice: 'Successfully deleted a jobrole'
    else
      redirect_to jobadd_path, notice: 'Couldnt a jobrole'
    end
  end

  private

  def job_position_params
    params.require(:job_position).permit(:jobdesignation)
  end
end
