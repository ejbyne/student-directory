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
#first we print the list of students
puts "The students of my cohort at Makers Academy"
puts "------------------"
students.each do |student|
  puts student
end
#finally, we print the total
puts "Overall, we have #{students.length} great students"
