
@students = []

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------------".center(50)
end

def print_students
   if @students.count <= 0
     return
   end
  cohort_list = @students.map do |a|
    a[:cohort]
  end
  cohort_list.uniq!
  cohort_list.sort!
  cohort_list.each do |cohort|
    puts "cohort: #{cohort}"
    @students.each do |student|
      if student[:cohort] == cohort
        puts student[:name]
      end
    end
  end
end

def print_footer
  if @students.count <= 0
    return
  end
  puts "Overall, we have #{@students.count} great #{@s}".center(50)
end

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  name = STDIN.gets.gsub(/\n/,"")
  puts "please enter which cohort he/she is in"
  cohort = STDIN.gets.gsub(/\n/,"").to_sym
  while !name.empty? do
    #cohort ||= :november
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      @s = "student"
    else
      @s = "students"
    end
    puts "Now we have #{@students.count} #{@s}".center(50)
    cohort = ""
    name = STDIN.gets.gsub(/\n/,"")
    puts "please enter which cohort he/she is in"
    cohort = STDIN.gets.gsub(/\n/,"").to_sym
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to a csv"
  puts "4. Load the students from csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Please enter one of the options above"
  end
end


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close

end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
