# frozen_string_literal: true

require 'test_helper'

class JobMailerTest < ActionMailer::TestCase
  test 'cv_uploaded' do
    mail = JobMailer.cv_uploaded
    assert_equal 'Cv uploaded', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
