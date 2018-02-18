students_csv_content = File.read("students.csv")
lines = students_csv_content.split("\n")

students = []

lines[1..-1].each do |line|
  row = line.split(",")
  puts "Student(#{row[0]}): #{row[1]}"
end
