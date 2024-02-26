# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating an admin user with sample data
# Admin.create!(
#  email: 'admin@example.com',
#  password: 'testtest', # Note: This is just for illustration, use secure password hashing in production
#  name: 'Admin User',
#  admin_id: 999
# )

Admin.create!(
   email: 'aa@aaa',
   password: 'test111',
   name: '00001'
)

Admin.create!(
   email: 'bb@bb',
   password: 'test222',
   name: '00002'
)
# You can add more admin users if needed by duplicating the above line with different data.

# Run this seed file using the following command:
# rails db:seed