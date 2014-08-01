require_relative '../app/models/user'

module UsersImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/users.csv")
    field_names = nil
    User.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          user = User.create!(attribute_hash)
        end
      end
    end
  end
end
