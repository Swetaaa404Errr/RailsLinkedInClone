# frozen_string_literal: true

# lib/tasks/cleanup_duplicate_users.rake

# lib/tasks/cleanup_duplicate_users.rake

# lib/tasks/cleanup_duplicate_users.rake

namespace :cleanup do
  desc 'Delete duplicate users'
  task duplicate_users: :environment do
    # Find all users with duplicate email addresses
    users_with_duplicates = User.group(:email).having('COUNT(*) > 1').pluck(:email)

    # Iterate through each duplicate email and delete all but the first user
    users_with_duplicates.each do |email|
      User.where(email: email).order(:id).offset(1).destroy_all
    end

    puts "Deleted #{users_with_duplicates.count} duplicate users"
  end
end
