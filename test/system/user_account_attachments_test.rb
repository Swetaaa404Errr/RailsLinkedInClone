# frozen_string_literal: true

require 'application_system_test_case'

class UserAccountAttachmentsTest < ApplicationSystemTestCase
  setup do
    @user_account_attachment = user_account_attachments(:one)
  end

  test 'visiting the index' do
    visit user_account_attachments_url
    assert_selector 'h1', text: 'User Account Attachments'
  end

  test 'creating a User account attachment' do
    visit user_account_attachments_url
    click_on 'New User Account Attachment'

    fill_in 'Certificate', with: @user_account_attachment.certificate
    fill_in 'User account', with: @user_account_attachment.user_account_id
    click_on 'Create User account attachment'

    assert_text 'User account attachment was successfully created'
    click_on 'Back'
  end

  test 'updating a User account attachment' do
    visit user_account_attachments_url
    click_on 'Edit', match: :first

    fill_in 'Certificate', with: @user_account_attachment.certificate
    fill_in 'User account', with: @user_account_attachment.user_account_id
    click_on 'Update User account attachment'

    assert_text 'User account attachment was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User account attachment' do
    visit user_account_attachments_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User account attachment was successfully destroyed'
  end
end
