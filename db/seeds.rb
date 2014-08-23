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
                   {id:1, description: "כל הארץ"},
                   {id:11, description: "צפון"},
                   {id:21, description: "מרכז"},
                   {id:31, description: "דרום"}
               ])

puts 'Adding some ages'
Age.create!([
                {id:1, description: '0-1'},
                {id:11, description: '1-3'},
                {id:21, description: '3-10'},
                {id:31, description: '10-20'}
            ])
puts 'Adding some ages'
Price.create!([
                {id:1, description: 'פחות ממאה שקל'},
                {id:11, description: '100-200 ש״ח'},
                {id:21, description: '200-400 ש״ח'},
                {id:31, description: 'מעל 400 ש״ח'}
            ])
puts 'Adding some states'
State.create!([
                  {id:1, description: 'כמו חדש'},
                  {id:11, description: 'טוב מאוד'},
                  {id:21, description: 'טוב'},
                  {id:31, description: 'ישן'}
              ])

puts 'Adding some types'
Type.create!([
                 {id:1, description: 'קנבס'},
                 {id:11, description: 'ציור'},
                 {id:21, description: 'צילום'},
             ])

puts 'Adding some tags'
Tag.create!([
                {id:1, description: 'סלון'},
                {id:11, description: 'חדר שינה'},
                {id:21, description: 'חדר ילדים'},
                {id:31, description: 'מצויר'},
                {id:41, description: 'מצחיק'},
                {id:51, description: 'העתק של ציור מפורסם'},
                {id:61, description: 'מודרני'},
                {id:71, description: 'אומנותי'},
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
i1 = Item.new({id:1, user_id: 1,type_id: 21,description: 'a very nice picture', price_id: 1,height: '100',width: '80',age_id: 1,state_id: 11})
i11 = Item.new({id:11, user_id: 1,type_id: 1,description: 'a cool picture',price_id: 11,height: '50',width: '80',age_id: 11,state_id: 1})
i21 = Item.new({id:21, user_id: 11,type_id: 11,description: 'none',price_id: 21,height: '400',width: '180',age_id: 21,state_id: 11})
i31 = Item.new({id:31, user_id: 11,type_id: 1,description: 'daaaaaa',price_id: 1,height: '550',width: '810',age_id: 21,state_id: 31})
i1.image = open("http://images.fineartamerica.com/images-medium-large-5/winter-sparkle-original-madart-painting-megan-duncanson.jpg")
i11.image = open("http://www.osnatfineart.com/paintings/07-09/07-09-sunrise-painting-3680.jpg")
i21.image = open("http://webneel.com/daily/sites/default/files/images/daily/10-2013/5-tree-painting.jpg")
i31.image = open("http://www.galleryoilpainting.com/images/tree_of_life_painting_modern_art_01.jpg")
i1.save!
i21.save!
i31.save!

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