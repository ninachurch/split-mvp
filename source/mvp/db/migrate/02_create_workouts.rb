require_relative '../config'

class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :a_workout, :default => "Pushups"
      t.integer :a_qt, :default => 30
      t.string :b_workout, :default => "Crunches"
      t.integer :b_qt, :default => 60
      t.string :c_workout, :default => "Jumping Jacks"
      t.integer :c_qt, :default => 90
      t.integer :splits, :default => 3 #how many in a day, may stop using
      t.timestamps
    end
  end
end

