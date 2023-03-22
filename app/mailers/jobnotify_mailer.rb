# frozen_string_literal: true

class JobnotifyMailer < ApplicationMailer
  def job_notification(user, job)
    @user = user
    @job = job
    mail(to: @user.email, subject: 'New job post matching your interest')
  end
end
