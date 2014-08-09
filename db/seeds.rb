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
 {id: 11, name: 'moderator', flg_default: 0},
 {id: 21, name: 'user', flg_default: 1},
 {id: 31, name: 'read_only', flg_default: 0}
].each do |role|
  Role.create(role)
end

puts 'Adding some regions'
Region.create!([
                   {id:1, description: "All Israel"},
                   {id:11, description: "Zafon"},
                   {id:21, description: "Merkaz"},
                   {id:31, description: "Darom"}
               ])

puts 'Adding some ages'
Age.create!([
                {id:1, description: '0-1'},
                {id:11, description: '1-3'},
                {id:21, description: '3-10'},
                {id:31, description: '10-20'}
            ])

puts 'Adding some states'
State.create!([
                  {id:1, description: 'new'},
                  {id:11, description: 'very good'},
                  {id:21, description: 'good'},
                  {id:31, description: 'old'}
              ])

puts 'Adding some types'
Type.create!([
                 {id:1, description: 'canvas'},
                 {id:11, description: 'painting'},
                 {id:21, description: 'photo'},
             ])

puts 'Adding some tags'
Tag.create!([
                {id:1, description: 'salon'},
                {id:11, description: 'bedroom'},
                {id:21, description: 'kids'},
                {id:31, description: 'cartoon'},
                {id:41, description: 'funny'},
                {id:51, description: 'reproduction'},
                {id:61, description: 'modern'},
                {id:71, description: 'artistic'},
            ])

puts 'SETTING UP DEFAULT Administrator User'
admin = User.new(id:1, email: 'andrei.averkin@gmail.com', first_name: 'Andrei', last_name: 'Averkin',
                 password: Rails.application.secrets.admin_pass, password_confirmation: Rails.application.secrets.admin_pass)
admin.skip_confirmation!
admin.save!

puts 'SETTING UP DEFAULT Administrator User role'
admin.add_role 'admin'

puts 'Adding some users'
user = User.new(id:11, email: "john.doe@gmail.com", password: "johndoe7", encrypted_password: "$2a$10$vlDuYtxF8DWxxvoDyRQoXe8zW1xqPVoGvlEEY0cIv09.o136BtXmK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "John", last_name: "Doe", is_active: true, is_blocked: false, region_id: 11, phone: "0545470201")
user.skip_confirmation!
user.save!
user.add_role 'user'

puts 'Adding some items'
Item.create!([
                 {id:1, user_id: 1,type_id: 21,description: 'a very nice picture', image: '', original_price: '300',height: '100',width: '80',age_id: 1,state_id: 11},
                 {id:11, user_id: 1,type_id: 1,description: 'a cool picture', image: '',original_price: '200',height: '50',width: '80',age_id: 11,state_id: 1},
                 {id:21, user_id: 11,type_id: 11,description: 'none', image: '',original_price: '150',height: '400',width: '180',age_id: 21,state_id: 11},
                 {id:31, user_id: 11,type_id: 1,description: 'daaaaaa', image: '',original_price: '1500',height: '550',width: '810',age_id: 21,state_id: 31}
             ])
puts 'Adding some taggings'
Tagging.create!([
                    {id:1, item_id: 1, tag_id: 21},
                    {id:11, item_id: 1, tag_id: 1},
                    {id:21, item_id: 1, tag_id: 11},
                    {id:31, item_id: 11, tag_id: 31},
                    {id:41, item_id: 21, tag_id: 1},
                    {id:51, item_id: 21, tag_id: 51},
                    {id:61, item_id: 31, tag_id: 61},
                    {id:71, item_id: 31, tag_id: 71},
                ])
puts 'Adding some blocks'
Block.create!([
                  {id:1, user_id: 1, item_id: 31}
              ])
puts 'Adding some wants'
Want.create!([
                 {id:1, user_id: 11, item_id: 1, extra_mile: true}
             ])
puts 'Adding some swaps'
Swap.create!([
                 {id:1, user1_id: 1, user2_id: 11, user1_items: '21', user2_items: '31'}
             ])