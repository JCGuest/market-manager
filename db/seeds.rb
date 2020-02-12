# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# def title_creator
#    num = Random.rand(1..4)
#     if num == 1
#        return "Market Clerk"
#     elsif num == 2
#        return "Meat Cutter"
#     elsif num == 3
#        return "Team Leader"
#     else 
#        return "Assistant Team Leader"
#     end
# end

# def item_creator
#     num = Random.rand(1..4)
#     if num == 1
#        return "ground beef"
#     elsif num == 2
#        return "chicken breast"
#     elsif num == 3
#        return "prime ribeye"
#     else 
#        return "top sirloin"
#     end
# end

# def date_gen
#   year = 2020
#   random_month =Random.new.rand(1..12)
#   random_day  = Random.new.rand(1..30)
#   "#{Date.new(year,random_month,random_day)}"
# end
#10.times do 
# Order.create({item: "meat", pick_up: 2020-01-01, clerk_id: 1, patron_id: 1})
# clerk = Clerk.create({email: Faker::Internet.unique.email, title: title_creator})

#patron = Patron.create({name: Faker::Name.unique.name, phone: Faker::Number.unique.number(digits: 10)})
