require 'csv'

CSV.foreach(__FILE__) do |row|
  puts row
end
