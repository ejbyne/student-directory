#Let's put all students into an array
def input_students
  print "Please enter the names of the students\n"
  print "To finish, just hit return twice\n"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    print "Please enter the student's hobbies\n"
    hobbies = gets.chomp
    print "Please enter the student's country of birth\n"
    birth_country = gets.chomp
    print "Please enter the student's height\n"
    height = gets.chomp
    students << {
      :name => name,
      :cohort => :october,
      :hobbies => hobbies,
      :birth_country => birth_country,
      :height => height
    }
    print "Now we have #{students.length} students\n"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy".center(100)
  puts "------------------".center(100)
end

def print_list(students)
  i = 0
  while i < students.length
    puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort; hobbies: #{students[i][:hobbies]}; country of birth: #{students[i][:birth_country]}; height: #{students[i][:height]})".center(100)
    i += 1
  end
end

def print_footer(students)
  print "Overall, we have #{students.length} great students\n"
end

students = input_students
print_header
print_list(students)
print_footer(students)
