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
                   {id:1, description: "All Israel"},
                   {id:2, description: "Zafon"},
                   {id:3, description: "Merkaz"},
                   {id:4, description: "Darom"}
               ])

puts 'Adding some ages'
Age.create!([
                {id:1, description: '0-1'},
                {id:2, description: '1-3'},
                {id:3, description: '3-10'},
                {id:4, description: '10-20'}
            ])

puts 'Adding some states'
State.create!([
                  {id:1, description: 'new'},
                  {id:2, description: 'very good'},
                  {id:3, description: 'good'},
                  {id:4, description: 'old'}
              ])

puts 'Adding some types'
Type.create!([
                 {id:1, description: 'canvas'},
                 {id:2, description: 'painting'},
                 {id:3, description: 'photo'},
             ])

puts 'Adding some tags'
Tag.create!([
                {id:1, description: 'salon'},
                {id:2, description: 'bedroom'},
                {id:3, description: 'kids'},
                {id:4, description: 'cartoon'},
                {id:5, description: 'funny'},
                {id:6, description: 'reproduction'},
                {id:7, description: 'modern'},
                {id:8, description: 'artistic'},
            ])

puts 'SETTING UP DEFAULT Administrator User'
admin = User.new(id:1, email: 'andrei.averkin@gmail.com', first_name: 'Andrei', last_name: 'Averkin',
                 password: Rails.application.secrets.admin_pass, password_confirmation: Rails.application.secrets.admin_pass)
admin.skip_confirmation!
admin.save!

puts 'SETTING UP DEFAULT Administrator User role'
admin.add_role 'admin'

puts 'Adding some users'
user = User.new(id:2, email: "john.doe@gmail.com", password: "johndoe7", encrypted_password: "$2a$10$vlDuYtxF8DWxxvoDyRQoXe8zW1xqPVoGvlEEY0cIv09.o136BtXmK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "John", last_name: "Doe", is_active: true, is_blocked: false, region_id: 2, phone: "0545470201")
user.skip_confirmation!
user.save!
user.add_role 'user'

puts 'Adding some items'
Item.create!([
                 {id:1, user_id: 1,type_id: 3,description: 'a very nice picture', image: '', original_price: '300',height: '100',width: '80',age_id: 1,state_id: 2},
                 {id:2, user_id: 1,type_id: 1,description: 'a cool picture', image: '',original_price: '200',height: '50',width: '80',age_id: 2,state_id: 1},
                 {id:3, user_id: 2,type_id: 2,description: 'none', image: '',original_price: '150',height: '400',width: '180',age_id: 3,state_id: 2},
                 {id:4, user_id: 2,type_id: 1,description: 'daaaaaa', image: '',original_price: '1500',height: '550',width: '810',age_id: 3,state_id: 4}
             ])
puts 'Adding some taggings'
Tagging.create!([
                    {id:1, item_id: 1, tag_id: 3},
                    {id:2, item_id: 1, tag_id: 1},
                    {id:3, item_id: 1, tag_id: 2},
                    {id:4, item_id: 2, tag_id: 4},
                    {id:5, item_id: 3, tag_id: 1},
                    {id:6, item_id: 3, tag_id: 6},
                    {id:7, item_id: 4, tag_id: 7},
                    {id:8, item_id: 4, tag_id: 8},
                ])
puts 'Adding some blocks'
Block.create!([
                  {id:1, user_id: 1, item_id: 4}
              ])
puts 'Adding some wants'
Want.create!([
                 {id:1, user_id: 2, item_id: 1, extra_mile: true}
             ])
puts 'Adding some swaps'
Swap.create!([
                 {id:1, user1_id: 1, user2_id: 2, user1_items: '2', user2_items: '3'}
             ])