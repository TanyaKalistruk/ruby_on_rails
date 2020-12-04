# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

table = CSV.parse(File.read("db/file.csv"), headers: true)
@counter = 0
table.each do |row|
  @counter += 1
  @row_hash = row.to_h
  ProstorItem.create({:item_id => @counter, :item_name => @row_hash["name"], :price => @row_hash["price"],
                      :is_deleted => "false"})
end


User.create({:user_id => 1, :username => "admin", :password => "admin",:name => "Tania",
                    :role => "admin"})
