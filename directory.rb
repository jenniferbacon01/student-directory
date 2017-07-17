def print_header
  puts "The students of Villains Academy"
  puts "-----------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]} (#{students[i][:cohort]}) cohort hobby: #{students[i][:hobby]} height: #{students[i][:height]}"
    i +=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  puts "enter hobby"
  hobby = gets.chomp
  puts "enter height"
  height = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth: :UK, height: height}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    puts "enter hobby"
    hobby = gets.chomp
    puts "enter height"
    height = gets.chomp
  end
  students
end



#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
