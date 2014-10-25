#Let's put all students into an array
students = [
  "Ed B",
  "Ben H",
  "Rich L",
  "Chris H",
  "Victoria S",
  "Ella S",
  "Izzy M",
  "Nick D",
  "Alex B",
  "Giorgia A",
  "Chris B",
  "Dale S",
  "Alan B",
  "Tim S",
  "Mishal I",
  "Pavel R",
  "Simon L",
  "Clare T",
  "Claudia B",
  "Ben C"
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "------------------"
end

def print_names(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

print_header
print_names(students)
print_footer(students)
