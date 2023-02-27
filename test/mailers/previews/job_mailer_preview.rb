# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/job_mailer/cv_uploaded
  def cv_uploaded
    JobMailer.cv_uploaded
  end
end
