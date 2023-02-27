# frozen_string_literal: true

require 'test_helper'

class UserAccountAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_account_attachment = user_account_attachments(:one)
  end

  test 'should get index' do
    get user_account_attachments_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_account_attachment_url
    assert_response :success
  end

  test 'should create user_account_attachment' do
    assert_difference('UserAccountAttachment.count') do
      post user_account_attachments_url,
           params: { user_account_attachment: { certificate: @user_account_attachment.certificate,
                                                user_account_id: @user_account_attachment.user_account_id } }
    end

    assert_redirected_to user_account_attachment_url(UserAccountAttachment.last)
  end

  test 'should show user_account_attachment' do
    get user_account_attachment_url(@user_account_attachment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_account_attachment_url(@user_account_attachment)
    assert_response :success
  end

  test 'should update user_account_attachment' do
    patch user_account_attachment_url(@user_account_attachment),
          params: { user_account_attachment: { certificate: @user_account_attachment.certificate,
                                               user_account_id: @user_account_attachment.user_account_id } }
    assert_redirected_to user_account_attachment_url(@user_account_attachment)
  end

  test 'should destroy user_account_attachment' do
    assert_difference('UserAccountAttachment.count', -1) do
      delete user_account_attachment_url(@user_account_attachment)
    end

    assert_redirected_to user_account_attachments_url
  end
end
