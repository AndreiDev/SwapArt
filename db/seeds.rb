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

puts 'Adding some regions'
Region.create!([
                   {description: "All Israel"},
                   {description: "Zafon"},
                   {description: "Merkaz"},
                   {description: "Darom"}
               ])

puts 'Adding some ages'
Age.create!([
                {description: '0-1'},
                {description: '1-3'},
                {description: '3-10'},
                {description: '10-20'}
            ])

puts 'Adding some states'
State.create!([
                  {description: 'new'},
                  {description: 'very good'},
                  {description: 'good'},
                  {description: 'old'}
              ])

puts 'Adding some types'
Type.create!([
                 {description: 'canvas'},
                 {description: 'painting'},
                 {description: 'photo'},
             ])

puts 'Adding some tags'
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
user = User.new(email: "john.doe@gmail.com", password: "johndoe7", encrypted_password: "$2a$10$vlDuYtxF8DWxxvoDyRQoXe8zW1xqPVoGvlEEY0cIv09.o136BtXmK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "John", last_name: "Doe", is_active: true, is_blocked: false, region_id: 2, phone: "0545470201")
user.skip_confirmation!
user.save!
user.add_role 'user'

puts 'Adding some items'
Item.create!([
                 {user_id: 1,type_id: 3,description: 'a very nice picture', image_url: 'img1.jpg', original_price: '300',height: '100',width: '80',age_id: 1,state_id: 2},
                 {user_id: 1,type_id: 1,description: 'a cool picture', image_url: 'img2.jpg',original_price: '200',height: '50',width: '80',age_id: 2,state_id: 1},
                 {user_id: 2,type_id: 2,description: 'none', image_url: 'img3.jpg',original_price: '150',height: '400',width: '180',age_id: 3,state_id: 2},
                 {user_id: 2,type_id: 1,description: 'daaaaaa', image_url: 'img4.jpg',original_price: '1500',height: '550',width: '810',age_id: 3,state_id: 4}
             ])
puts 'Adding some taggings'
Tagging.create!([
                    {item_id: 1, tag_id: 3},
                    {item_id: 1, tag_id: 1},
                    {item_id: 1, tag_id: 2},
                    {item_id: 2, tag_id: 4},
                    {item_id: 3, tag_id: 1},
                    {item_id: 3, tag_id: 6},
                    {item_id: 4, tag_id: 7},
                    {item_id: 4, tag_id: 8},
                ])
puts 'Adding some blocks'
Block.create!([
                  {user_id: 1, item_id: 4}
              ])
puts 'Adding some wants'
Want.create!([
                 {user_id: 2, item_id: 1, extra_mile?: true}
             ])
puts 'Adding some swaps'
Swap.create!([
                 {user1_id: 1, user2_id: 2, user1_items: '2', user2_items: '3'}
             ])