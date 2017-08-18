# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Person.create(name:'Taro', age:38, mail:'taro@yamada')
# Person.create(name:'Hanako', age:34, mail:'hanako@flower')
# Person.create(name:'sachiko', age:56, mail:'sachiko@happy')

# Blogconfig.create(id:1, title:'my blog', subtitle:'サンプルで作ったブログです。', stylename: 'gray')


# Users.create(no:1, name:'山田', kana:'やまだ',)

# (10..31).each do |number|
#   Division.create(no: number, name: 'division ' + number.to_s )
# end
# (10..31).each do |number|
#   User.create(no: number, name: 'user ' + number.to_s, kana: 'user ' + number.to_s, memo: 'memo ' + number.to_s, division_id: number )
# end
(1..9).each do |number|
  Report.create(entry_date: '2017-01-0' + number.to_s, user_id: 1, report: 'test report' )
end
