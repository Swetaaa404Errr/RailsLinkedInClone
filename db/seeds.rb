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

users = User.create(email: 'testuser@gmail.com', username: 'testuser', password: 'user22',
                    password_confirmation: 'user22', admin: false)

users = User.create(email: 'sritam9@gmail.com', username: 'sritam9', password: 'srisri',
                    password_confirmation: 'srisri', admin: false)

# generate 20 users
