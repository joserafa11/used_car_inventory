# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'admin', password: 'admin', password_confirmation: 'admin', user_type: 'admin')
User.create!(username: 'user', password: 'user', password_confirmation: 'user', user_type: 'user')

Setting.create!(code: 'monthly_deprecation', value: '0.02')