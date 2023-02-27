# frozen_string_literal: true

class JobMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_mailer.cv_uploaded.subject
  #
  def cv_uploaded(user, cv)
    @cv = cv
    mail(
      from: 'supportLinkedIn@gmail.com',
      to: user.email,

      subject: 'Applicant has uploaded cv'
    )
  end
end
