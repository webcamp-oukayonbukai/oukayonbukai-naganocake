# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@gmail.com',
  password: '000000'
  )

Genre.create!(
  name: 'ケーキ'
  )
Genre.create!(
  name: 'プリン'
  )
Genre.create!(
  name: '焼き菓子'
  )
Genre.create!(
  name: 'キャンディ'
  )

Customer.create!(
  last_name: '山田',
  first_name: '花子',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'ハナコ',
  postal_code: '0000000',
  address: '山梨県山梨市人梨町',
  telephone_number: '00000000000',
  email: 'customer@gmail.com',
  password: '000000',
  withdraw_status: 'false'
  )