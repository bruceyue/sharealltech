# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.transaction do
  (1..100).each do |i|
    Post.create(title: "Post test result #{i}",
      body: "customer-#{i}@example.com, this my test. test<br/> This file should contain all the record creation needed to seed the database with its default values.
			# The data can then be loaded<br/> with the rake db:seed (or created alongsi")
  end
end
