def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------------".center(50)
end

def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]} (#{students[i][:cohort]}) cohort hobby: #{students[i][:hobby]} height: #{students[i][:height]}"
    i +=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  students =[]
  name = gets.chomp
  puts "enter hobby".center(50)
  hobby = gets.chomp
  puts "enter height".center(50)
  height = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, hobby: hobby, country_of_birth: :UK, height: height}
    puts "Now we have #{students.count} students".center(50)
    name = gets.chomp
    puts "enter hobby".center(50)
    hobby = gets.chomp
    puts "enter height".center(50)
    height = gets.chomp
  end
  students
end



#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
