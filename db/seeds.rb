# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admins = User.create(email: 'admin333@gmail.com', username: 'admin333', password: 'add223',
                     password_confirmation: 'add223', admin: true)

users = User.create(email: 'trieluser@gmail.com', username: 'user22', password: 'password',
                    password_confirmation: 'password', admin: false)

10.times do
  User.create(email: 'admin333@gmail.com', username: 'admin333', password: 'add223',
              password_confirmation: 'add223', admin: true)
end
