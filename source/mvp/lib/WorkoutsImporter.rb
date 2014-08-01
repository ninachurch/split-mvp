require_relative '../app/models/workout'

module WorkoutsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/workouts.csv")
    field_names = nil
    Workout.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          workout = Workout.create!(attribute_hash)
        end
      end
    end
  end
end
