#Let's put all students into an array
students = [
  {:name => "Ed B", :cohort => :october},
  {:name => "Ben H", :cohort => :october},
  {:name => "Rich L", :cohort => :october},
  {:name => "Chris H", :cohort => :october},
  {:name => "Victoria S", :cohort => :october},
  {:name => "Ella S", :cohort => :october},
  {:name => "Izzy M", :cohort => :october},
  {:name => "Nick D", :cohort => :october},
  {:name => "Alex B", :cohort => :october},
  {:name => "Giorgia A", :cohort => :october},
  {:name => "Chris B", :cohort => :october},
  {:name => "Dale S", :cohort => :october},
  {:name => "Alan B", :cohort => :october},
  {:name => "Tim S", :cohort => :october},
  {:name => "Mishal I", :cohort => :october},
  {:name => "Pavel R", :cohort => :october},
  {:name => "Simon L", :cohort => :october},
  {:name => "Clare T", :cohort => :october},
  {:name => "Claudia B", :cohort => :october},
  {:name => "Ben C", :cohort => :october}
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

print_header
print(students)
print_footer(students)
