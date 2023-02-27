# frozen_string_literal: true

class ApplyjobMailer < ApplicationMailer
  def new_applyjob(user, file)
    attachments[file.filename.to_s] = file.download
    mail(
      to: user,

      subject: 'New Application for your job'
    )
  end
end
