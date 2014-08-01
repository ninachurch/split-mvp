require_relative '../controller'

# AVAILABLE WORKOUTS

student_1 = {first_name: "Cassidy", last_name: "Clawson", phone: "18312473750", workout_id: 1}
student_2 = {first_name: "Premila", last_name: "Anand", phone: "14152860731", workout_id: 2}

##Choose Brick's Meditation Routine or a Strength Program ($brick_workout, $power_workout)

User.add_user(student_2)
User.add_user(student_1)

puts "GET READY TO SPLIT!"

var = gets.chomp
