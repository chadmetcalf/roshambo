# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\n\n"
print "Creating Challenger: "
# password = Challenger.new(password: 'abcd1234').encrypted_password
# Challenger.bulk_insert do |worker|
#   10_000.times do |i|
#     begin
#       print "." if i%20_000
#       worker.add(email: Faker::Internet.email, encrypted_password: password)
#     rescue
#       next
#     end
#   end
# end

puts "\n"
print "Creating Games: "
c_ids = Challenger.ids
1000.times do
Game.bulk_insert do |worker|
  (1_000).times do |i|
    begin
      print "." if i%200_000 == 0
      g_state = Game.states.sample

      g_attrs = {challenger_id: c_ids.sample, state: g_state}

      worker.add(g_attrs)
    end
  end
end
end
