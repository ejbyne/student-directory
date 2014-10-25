@students = []

def interactive_menu
  loop do
  	print_menu
  	process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  	when "1"
  	  @students = input_students
  	when "2"
  	  show_students
    when "3"
      save_students
    when "4"
      load_students
  	when "9"
  	  exit
  	else
  	 puts "I don't know what you mean, try again"
   end
 end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
  	student_data = [student[:name], student[:cohort], student[:hobbies], student[:birth_country], student[:height]]
  	csv_line = student_data.join(", ")
  	file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
  	load_students(filename)
  	puts "Loaded #{@students.length} from #{filename}"
  else
  	puts "Sorry, #{filename} doesn't exist."
  	exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  	name, cohort, hobbies, birth_country, height = line.chomp.split(", ")
  	@students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies, :birth_country => birth_country, :height => height}
  end
  file.close
end

def input_students
  print "Please enter the names of the students\n"
  print "To finish, just hit return twice\n"
  # get the first name
  name = STDIN.gets.gsub("\n", "")
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    while true
    print "Please enter the student's cohort\n"
    cohort_input = STDIN.gets.chomp.downcase
      if cohort_input.empty?
        cohort = :unknown
        break
      elsif cohort_input == "january" || cohort_input == "february" || cohort_input == "march" || cohort_input == "april" || cohort_input == "may" || cohort_input == "june" || cohort_input == "july" || cohort_input == "august" || cohort_input == "september" || cohort_input == "october" || cohort_input == "november" || cohort_input == "december"
        cohort = cohort_input.to_sym
        break
      else
        print "Cohort not recognised\n"
      end
    end
    print "Please enter the student's hobbies\n"
    hobbies = STDIN.gets.chomp
    print "Please enter the student's country of birth\n"
    birth_country = STDIN.gets.chomp
    print "Please enter the student's height\n"
    height = STDIN.gets.chomp
    @students << {
      :name => name,
      :cohort => cohort,
      :hobbies => hobbies,
      :birth_country => birth_country,
      :height => height
    }
    print "Now we have #{@students.length} "
    if @students.length > 1
  	  print "students\n"
    else
  	  print "student\n"
    end
    #get another name from the user
    name = STDIN.gets.gsub("\n", "")
  end
  # return the array of students
  @students
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of the cohorts at Makers Academy".center(100)
  puts "------------------".center(100)
end

def print_students_list
  if @students.length > 0
    x = 1
    @students.each do |student|
      puts "#{x}. #{student[:name]} (#{student[:cohort]} cohort; hobbies: #{student[:hobbies]}; country of birth: #{student[:birth_country]}; height: #{student[:height]})".center(100)
      x += 1
    end
  else
  	puts "No students to list".center(100)
  end
end

def print_footer
  if @students.length > 0
    print "Overall, we have #{@students.length} great "
    if @students.length > 1
  	  print "students\n"
    else
  	  print "student\n"
    end
  end
end

try_load_students
interactive_menu

