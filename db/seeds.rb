# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

admins = User.create(email: 'admin333@gmail.com', username: 'admin333', password: 'add223',
                     password_confirmation: 'add223', admin: true)

admins = User.create(email: 'iamadmin@gmail.com', username: 'iamadmin', password: 'add2',
                     password_confirmation: 'add2', admin: true)

users = User.create(email: 'trieluser@gmail.com', username: 'user22', password: 'password',
                    password_confirmation: 'password', admin: false)

users = User.create(email: 'user@gmail.com', username: 'user', password: 'user1',
                    password_confirmation: 'user1', admin: false)



users = User.create(email: 'sritam9@gmail.com', username: 'sritam9', password: 'srisri',
                    password_confirmation: 'srisri', admin: false)

user_ids = [4, 5]

UserAccount.where(user_id: user_ids).destroy_all

user_data = [
  {
    user_id: 4,
    username: 'user12',
    gmail: 'user@gmail.com',
    link: nil,
    qualification: 'BA',
    experience: '0-3',
    organisation: 'ABC Company',
    skill: 'devops,editing',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Developer,Cook',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 5,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'React',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  }
]

user_data.each do |data|
  UserAccount.create!(data)
end

user_ids = [4, 5]

user_ids.each do |user_id|
  user = User.find(user_id)
  user.job_navigations.create(
    jobtitle: 'Software Engineer',
    jobdescription: 'We are seeking an experienced software engineer to join our team.',
    vacancy: '11',
    skill: 'Ruby on Rails, React, PostgreSQL',
    jobrole: 'Developer',
    jobsector: 'Corporate',
    is_approved: true
  )
end

# create a new job field record for the user
job_field = JobField.create(jobsection: 'Finance')

# create a new job position record for the user
job_position = JobPosition.create(jobdesignation: 'CA')

# db/seeds.rb

# generate 20 users
