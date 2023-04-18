# frozen_string_literal: true

module ApplicationHelper
  def checked(area)
    @user_account.job.nil? ? false : @user_account.job.match(area)
  end

  def show_errors(object, field_name)
    return unless object.errors.any?
    return if object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end
end
