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
                   {id:1, description: "גוש דן"},
                   {id:11, description: "שפלה"},
                   {id:21, description: "צפון"},
                   {id:31, description: "דרום"}
               ])

puts 'Adding some ages'
Age.create!([
                {id:1, description: 'פחות משנה'},
                {id:11, description: '1-3 שנים'},
                {id:21, description: '3-10 שנים'},
                {id:31, description: 'מעל 10 שנה'}
            ])
puts 'Adding some ages'
Price.create!([
                {id:1, description: 'עד מאה ש״ח'},
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
                 {id:31, description: 'לחדר ילדים'}
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
user = User.new(id:11, email: "netanyahu@gmail.com", password: "password", encrypted_password: "$2a$10$Ox2XG9aEo9TtAmrkl2rtBOMgwwcePwH9qfWW03F5yXWcIWrEFxEKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "בנימין", last_name: "נתניהו", is_active: true, is_blocked: false, region_id: 11, phone: "0559977332")
user.skip_confirmation!
user.save!
user.add_role 'user'

user = User.new(id:21, email: "lapid@gmail.com", password: "password", encrypted_password: "$2a$10$Ox2XG9aEo9TtAmrkl2rtBOMgwwcePwH9qfWW03F5yXWcIWrEFxEKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "יאיר", last_name: "לפיד", is_active: true, is_blocked: false, region_id: 21, phone: "0511232322")
user.skip_confirmation!
user.save!
user.add_role 'user'

user = User.new(id:31, email: "yechimovich@gmail.com", password: "password", encrypted_password: "$2a$10$Ox2XG9aEo9TtAmrkl2rtBOMgwwcePwH9qfWW03F5yXWcIWrEFxEKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "שלי", last_name: "יחימוביץ׳", is_active: true, is_blocked: false, region_id: 31, phone: "0544335532")
user.skip_confirmation!
user.save!
user.add_role 'user'

user = User.new(id:41, email: "saar@gmail.com", password: "password", encrypted_password: "$2a$10$Ox2XG9aEo9TtAmrkl2rtBOMgwwcePwH9qfWW03F5yXWcIWrEFxEKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "גדעון", last_name: "סער", is_active: true, is_blocked: false, region_id: 31, phone: "0514533354")
user.skip_confirmation!
user.save!
user.add_role 'user'

user = User.new(id:51, email: "piron@gmail.com", password: "password", encrypted_password: "$2a$10$Ox2XG9aEo9TtAmrkl2rtBOMgwwcePwH9qfWW03F5yXWcIWrEFxEKO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2014-07-20 19:16:19", last_sign_in_at: "2014-07-20 19:16:19", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2014-07-20 19:16:19", confirmation_sent_at: nil, unconfirmed_email: nil, first_name: "שי", last_name: "פירון", is_active: true, is_blocked: false, region_id: 21, phone: "0513323324")
user.skip_confirmation!
user.save!
user.add_role 'user'

puts 'Adding some items'
Item.create!({id:1, user_id: 11, type_id: 21, image_url: 'sample1.jpg', description: 'תמונה מה זה מדליקה!!!', price_id: 1,height: '100',width: '80',age_id: 1,state_id: 11})
Item.create!({id:11, user_id: 11, type_id: 1, image_url: 'sample2.jpg', description: 'התמונה הייתה בחדר שינה - מאוד אלגנטית',price_id: 11,height: '50',width: '80',age_id: 11,state_id: 1})
Item.create!({id:21, user_id: 11, type_id: 11, image_url: 'sample3.jpg', description: 'משרה אווירה רומנטית ומיוחדת',price_id: 21,height: '400',width: '180',age_id: 21,state_id: 11})
Item.create!({id:31, user_id: 21, type_id: 31, image_url: 'sample4.jpg', description: 'אין לי מה לכתוב על התמונה...',price_id: 31,height: '550',width: '810',age_id: 21,state_id: 31})
Item.create!({id:41, user_id: 21, type_id: 21, image_url: 'sample5.jpg', description: 'אחלה תמונה, מאוד מומלצת',price_id: 21,height: '50',width: '100',age_id: 31,state_id: 11})
Item.create!({id:51, user_id: 21, type_id: 11, image_url: 'sample6.jpg', description: 'אין תמונות כאלה!',price_id: 31,height: '250',width: '110',age_id: 11,state_id: 1})
Item.create!({id:61, user_id: 31, type_id: 1, image_url: 'sample7.jpg', description: 'תמונה שקיבלתי מסבתא שלי',price_id: 11,height: '250',width: '210',age_id: 11,state_id: 1})
Item.create!({id:71, user_id: 31, type_id: 11, image_url: 'sample8.jpg', description: 'וואלה אחלה תמונה',price_id: 1,height: '50',width: '210',age_id: 21,state_id: 11})
Item.create!({id:81, user_id: 31, type_id: 31, image_url: 'sample9.jpg', description: 'התמונה בעלת אנרגיות חיוביות ביותר',price_id: 31,height: '150',width: '110',age_id: 31,state_id: 31})
Item.create!({id:91, user_id: 31, type_id: 31, image_url: 'sample10.jpg', description: 'התמונה הכי יפה שראיתי מימי!',price_id: 11,height: '110',width: '110',age_id: 11,state_id: 31})
Item.create!({id:101, user_id: 41, type_id: 21, image_url: 'sample11.jpg', description: 'יופי של תמונה לילדים',price_id: 21,height: '150',width: '210',age_id: 1,state_id: 1})
Item.create!({id:111, user_id: 51, type_id: 11, image_url: 'sample12.jpg', description: 'נראית מצויין לצד עיצוב מודרני',price_id: 1,height: '50',width: '110',age_id: 1,state_id: 11})
Item.create!({id:121, user_id: 51, type_id: 31, image_url: 'sample13.jpg', description: 'תמונה מגניבה ביותר, שמורה מאוד',price_id: 1,height: '50',width: '60',age_id: 21,state_id: 11})
Item.create!({id:131, user_id: 51, type_id: 1, image_url: 'sample14.jpg', description: 'סבבה של תמונה',price_id: 11,height: '150',width: '130',age_id: 1,state_id: 21})
Item.create!({id:141, user_id: 51, type_id: 11, image_url: 'sample15.jpg', description: 'מתאימה לכל חדר',price_id: 21,height: '150',width: '110',age_id: 21,state_id: 11})

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
                 {id:1, user_id: 11, item_id: 101, extra_mile: true},
                 {id:11, user_id: 11, item_id: 111, extra_mile: true},
                 {id:21, user_id: 21, item_id: 101, extra_mile: true},
                 {id:31, user_id: 41, item_id: 11, extra_mile: true},
                 {id:41, user_id: 41, item_id: 21, extra_mile: true}
             ])
puts 'Adding some swaps'
Swap.create!([
                 {id:1, swapper_id: 1, swappee_id: 11, clicked_item_id: 31, swapper_items: '21', swappee_items: '31'}
             ])