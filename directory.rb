def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------------".center(50)
end

def print(students)
  if students.count <= 0
    return
  end
  cohort_list = students.map do |a|
    a[:cohort]
  end
  cohort_list.uniq!
  cohort_list.sort!
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
  if students.count <= 0
    return
  end
  puts "Overall, we have #{students.count} great #{@s}".center(50)
end

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  students =[]
  name = gets.gsub(/\n/,"")
  puts "please enter which cohort he/she is in"
  cohort = gets.gsub(/\n/,"").to_sym
  while !name.empty? do
    cohort ||= :november
    students << {name: name, cohort: cohort}
    if students.count == 1
      @s = "student"
    else
      @s = "students"
    end
    puts "Now we have #{students.count} #{@s}".center(50)
    cohort = ""
    name = gets.gsub(/\n/,"")
    puts "please enter which cohort he/she is in"
    cohort = gets.gsub(/\n/,"").to_sym
    #cohort ||= :november

  end
  students
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "Please enter one of the options above"
    end
  end
end



#nothing happens until we call the methods


interactive_menu
