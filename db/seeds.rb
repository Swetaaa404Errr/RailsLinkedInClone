# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# in your seeds.rb file

# generate 20 dummy users with ids ranging from 14 to 35
users = []
(1..30).each do |i|
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: "password", # or use Faker::Internet.password to generate a random password
    password_confirmation: "password",
    admin: false,
    id: i
  )
   users << user
end
(31..33).each do |i|
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: "password", # or use Faker::Internet.password to generate a random password
    password_confirmation: "password",
    admin: true,
    id: i
  )
end


user_data = [
  {
    user_id: 1,
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
    user_id: 2,
    username: 'user2',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'React,ajile',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,WebEngineer,Engineer,Receiptionist,Caretaker,Developer',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 3,
    username: 'user3',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'editing,devops',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,Engineer',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 4,
    username: 'user4',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'python,java',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,Receiptionist,Caretaker,Developer',
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
    skill: 'react,devops',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,Engineer,Receiptionist',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 6,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'ajile',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 7,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'rails',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,Developer',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 8,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'c,rails',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,,WebEngineer,Engineer',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 9,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'java',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,Caretaker',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    user_id: 10,
    username: 'sritam9',
    gmail: 'sritamd9@gmail.com',
    link: nil,
    qualification: 'BE',
    experience: '5-10',
    organisation: 'XYZ Company',
    skill: 'python,c',
    notification: true,
    cv: nil,
    picture: nil,
    certificate: nil,
    job: 'Cook,WebEngineer',
    cvdownload: 'Connections',
    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  }

]

user_data.each do |data|
  UserAccount.create!(data)
end



job_data = [
  {
    user_id: 1,
    jobtitle: "WebEngineer",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "2 positions",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
},
{
    user_id: 2,
    jobtitle: "Developer",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "2",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: true
},
{
    user_id: 3,
    jobtitle: "Caretaker",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "5",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
},
{
    user_id: 4,
    jobtitle: "Cook",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "18",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
},
{
    user_id: 5,
    jobtitle: "Receiptionist",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "7",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
},
{
    user_id: 6,
    jobtitle: "Caretaker",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "22",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
},
{
    user_id: 7,
    jobtitle: "Driver",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "66",
    skill: "react,ajile",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: true
},
{
    user_id: 8,
    jobtitle: "Receiptionist",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "20",
    skill: "java,c",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: true
},
{
    user_id: 9,
    jobtitle: "Developer",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "56",
    skill: "Ruby on Rails, React, Python",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: true
  },
{
    user_id: 10,
    jobtitle: "Software Engineer",
    jobdescription: "We are seeking an experienced software engineer to join our team.",
    vacancy: "77",
    skill: "Ruby on Rails, React, PostgreSQL",
    jobrole: "Full-time",
    jobsector: "Technology",
    is_approved: false
}
]

job_data.each do |data|
  JobNavigation.create!(data)
end

job_field = JobField.create(jobsection: 'Finance')

# create a new job position record for the user
job_position = JobPosition.create(jobdesignation: 'CA')

users[1].send_follow_request_to(users[9])
users[9].accept_follow_request_of(users[1])

users[3].send_follow_request_to(users[2])
users[2].accept_follow_request_of(users[3])

users[8].send_follow_request_to(users[3])
users[3].accept_follow_request_of(users[8])


users[1].send_follow_request_to(users[4])
users[4].accept_follow_request_of(users[1])

users[1].send_follow_request_to(users[5])
users[5].accept_follow_request_of(users[1])


users[2].send_follow_request_to(users[6])
users[6].accept_follow_request_of(users[2])


users[3].send_follow_request_to(users[7])
users[7].accept_follow_request_of(users[3])


users[4].send_follow_request_to(users[8])
users[8].accept_follow_request_of(users[4])


users[5].send_follow_request_to(users[9])
users[9].accept_follow_request_of(users[5])








# generate 20 users
