require_relative '../config'

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :workout_id, :default => 2
      t.integer :message_counter, :default => 0
      t.timestamps
    end
  end
end
