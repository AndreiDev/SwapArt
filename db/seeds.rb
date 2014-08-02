# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added default roles
puts 'SETTING UP DEFAULT ROLES'
[{id: 1, name: 'admin', flg_default: 0},
 {id: 2, name: 'moderator', flg_default: 0},
 {id: 3, name: 'user', flg_default: 1},
 {id: 4, name: 'read_only', flg_default: 0}
].each do |role|
  Role.create(role)
end

Region.create!([
                   {description: "All Israel"},
                   {description: "Zafon"},
                   {description: "Merkaz"},
                   {description: "Darom"}
               ])
Age.create!([
                {description: '0-1'},
                {description: '1-3'},
                {description: '3-10'},
                {description: '10-20'}
            ])
State.create!([
                  {description: 'new'},
                  {description: 'very good'},
                  {description: 'good'},
                  {description: 'old'}
              ])
Type.create!([
                 {description: 'canvas'},
                 {description: 'painting'},
                 {description: 'photo'},
             ])
Tag.create!([
                {description: 'salon'},
                {description: 'bedroom'},
                {description: 'kids'},
                {description: 'cartoon'},
                {description: 'funny'},
                {description: 'reproduction'},
                {description: 'modern'},
                {description: 'artistic'},
            ])

puts 'SETTING UP DEFAULT Administrator User'
admin = User.new(email: 'andrei.averkin@gmail.com', first_name: 'Andrei', last_name: 'Averkin',
                 password: Rails.application.secrets.admin_pass, password_confirmation: Rails.application.secrets.admin_pass)
admin.skip_confirmation!
admin.save!

puts 'SETTING UP DEFAULT Administrator User role'
admin.add_role 'admin'

puts 'Adding some users'
user = User.new(email: "john.doe@gmail.com", password: "johndoe7", encrypted_password: "$2a$10$vlDuYtxF8DWxxvoDyRQoXe8zW1xqPVoGvlEEY0cIv09.o136BtXmK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "John", last_name: "Doe", is_active?: true, is_blocked?: false, region_id: 2, phone: "0545470201")
user.skip_confirmation!
user.save!
user.add_role 'user'
