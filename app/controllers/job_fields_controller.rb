# frozen_string_literal: true

class JobFieldsController < ApplicationController
  before_action :require_admin

  def new
    @job_field = JobField.new
  end

  def create
    @job_field = JobField.new(job_field_params)

    if @job_field.save
      redirect_to job_field_path(@job_field), notice: 'Successfully added a jobsector'
    else
      render :new, notice: 'Please Provide valid data'
    end
  end

  def show
    @job_field = JobField.find(params[:id])
  end

  def edit
    @job_field = JobField.find(params[:id])
  end

  def update
    @job_field = JobField.find(params[:id])
    if @job_field.update(job_field_params)

      redirect_to jobadd_path, notice: 'Successfully updated jobfield'
    else

      render :edit
    end
  end

  def destroy
    @job_field = JobField.find(params[:id])
    if @job_field.destroy
      redirect_to jobadd_path, notice: 'Successfully deleted a jobield'
    else
      redirect_to jobadd_path, notice: 'Couldnt a jobfield'
    end
  end

  private

  def job_field_params
    params.require(:job_field).permit(:jobsection)
  end
end
