@students = []

def interactive_menu
  loop do
  	print_menu
  	process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
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
  	when "9"
  	  exit
  	else
  	 puts "I don't know what you mean, try again"
   end
 end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
  	student_data = [student[:name], student [:cohort]]
  	csv_line = student_data.join(", ")
  	file.puts csv_line
  end
  file.close
end

def input_students
  print "Please enter the names of the students\n"
  print "To finish, just hit return twice\n"
  # get the first name
  name = gets.gsub("\n", "")
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    while true
    print "Please enter the student's cohort\n"
    cohort_input = gets.chomp.downcase
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
    hobbies = gets.chomp
    print "Please enter the student's country of birth\n"
    birth_country = gets.chomp
    print "Please enter the student's height\n"
    height = gets.chomp
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
    name = gets.gsub("\n", "")
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
  puts "The students of my cohort at Makers Academy".center(100)
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

interactive_menu

