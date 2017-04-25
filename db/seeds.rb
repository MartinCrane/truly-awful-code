# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

me = Account.create(username: "steven", password: "beef101")
woot = me.posts.create(title: "Woot does shirts!", link: "http://shirt.woot.com")
teefury = me.posts.create(title: "TeeFury does shirts!", link: "http://teefury.com")
riptapparel = me.posts.create(title: "Ript does shirts!", link: "http://riptapparel.com")

11.times do
  woot.comments.create(body: "So great!", account: me)
end

5.times do
  teefury.comments.create(body: "So great!", account: me)
end
