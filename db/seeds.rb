# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'aa@aaa',
   password: 'pw1111',
   name: '00001'
)

Admin.create!(
   email: 'bb@bb',
   password: 'pw2222',
   name: '00002'
)

Student.create!(
   last_name: '飯尾',
   first_name: '正樹',
   last_name_kana: 'イイオ',
   first_name_kana: 'マサキ',
   email: 'msaii_102@example.org',
   telephone_number: '02013297171',
   address: '広島県埼玉市中通4-3-5',
   post_code: '1778989',
   grade: 2,
   school_name: '広島県小学校',
   subscription_day: '2024-01-15',
   student_status: 1,
   situation_status: 1
)

Student.create!(
   last_name: '横瀬',
   first_name: '優紀',
   last_name_kana: 'ヨコセ',
   first_name_kana: 'ユウキ',
   email: 'yykose@example.jp',
   telephone_number: '01015240422',
   address: '東京都東京市鶴川2-5-8',
   post_code: '8731010',
   grade: 4,
   school_name: '東京中学校',
   subscription_day: '2024-01-25',
   student_status: 1,
   situation_status: 1
)

Student.create!(
   last_name: '勝部',
   first_name: 'ゆかり',
   last_name_kana: 'カツベ',
   first_name_kana: 'ユカリ',
   email: 'ktyka234@example.jp',
   telephone_number: '01013979898',
   address: '大分県東京市三佐2-2-5	',
   post_code: '1738788',
   grade: 3,
   school_name: '大分県中学校',
   subscription_day: '2024-02-06',
   student_status: 1,
   situation_status: 1
)

Student.create!(
   last_name: '松下',
   first_name: '萌',
   last_name_kana: 'マツシタ',
   first_name_kana: 'モエ',
   email: 'wwwmm321@example.org',
   telephone_number: '01009309565',
   address: '神奈川県神奈川市相武台1-1-14',
   post_code: '7354525',
   grade: 4,
   school_name: '神奈川県中学校',
   subscription_day: '2024-02-13',
   student_status: 1,
   situation_status: 1
)

Student.create!(
   last_name: '古瀬',
   first_name: '春香',
   last_name_kana: 'フルセ',
   first_name_kana: 'ハルカ',
   email: 'hurrka456@example.jp',
   telephone_number: '0201116789',
   address: '千葉県静岡市習志野台2-4-15',
   post_code: '2286754',
   grade: 1,
   school_name: '千葉県小学校',
   subscription_day: '2024-02-25',
   student_status: 1,
   situation_status: 1
)



# You can add more admin users if needed by duplicating the above line with different data.

# Run this seed file using the following command:
# rails db:seed