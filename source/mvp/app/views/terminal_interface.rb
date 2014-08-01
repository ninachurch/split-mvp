require_relative '../controller'

# AVAILABLE WORKOUTS

student_1 = {first_name: "", last_name: "", phone: ""}
student_2 = {first_name: "", last_name: "", phone: ""}

##Choose Brick's Meditation Routine or a Strength Program ($brick_workout, $power_workout)

workout_choice1 = $brick_workout
workout_choice2 = $power_workout

User.add_user(student_2, workout_choice2)
User.add_user(student_1, workout_choice1)


"GET READY TO SPLIT!"

var = gets.chomp
