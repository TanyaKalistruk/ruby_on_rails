require 'csv'

namespace :db do
  desc "TODO"
  task populate: :environment do

    table = CSV.parse(File.read("db/file.csv"), headers: true)
    @counter = 0
    table.each do |row|
      @counter += 1
      @row_hash = row.to_h
      ProstorItem.create({:item_id => @counter, :item_name => @row_hash["name"], :price => @row_hash["price"],
                          :is_deleted => "false"})
    end
  end

end
