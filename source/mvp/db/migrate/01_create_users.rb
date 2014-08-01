require_relative '../config'

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :a_workout, :default => "Pushups"
      t.integer :a_qt, :default => 30
      t.string :b_workout, :default => "Crunches"
      t.integer :b_qt, :default => 60
      t.string :c_workout, :default => "Jumping Jacks"
      t.integer :c_qt, :default => 90
      t.integer :splits, :default => 3 #how many in a day, may stop using
      t.integer :how_often, :default => 1.5 # every x hours
      t.integer :message_counter, :default => 0
      t.integer :start_time, :default => 9
      t.integer :end_time, :default => 6
      t.boolean :mon_fri, :default => true
      t.timestamps
    end
  end
end
