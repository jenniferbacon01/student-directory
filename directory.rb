def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------------".center(50)
end

def print(students)
  cohort_list = students.map do |a|
    a[:cohort]
    #unless cohort_list.include?(students[a][:cohort])
  end
  cohort_list.uniq!.sort!
  cohort_list.each do |cohort|
    puts "cohort: #{cohort}"
    students.each do |student|
      if student[:cohort] == cohort
        puts student[:name]
      end
    end
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
  puts "please enter which cohort he/she is in"
  cohort = gets.chomp.to_sym
  cohort ||= :november
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(50)
    cohort = ""
    name = gets.chomp
    puts "please enter which cohort he/she is in"
    cohort = gets.chomp.to_sym
    #cohort ||= :november

  end
  students
end



#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
