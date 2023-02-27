# frozen_string_literal: true

json.array! @user_account_attachments, partial: 'user_account_attachments/user_account_attachment',
                                       as: :user_account_attachment
