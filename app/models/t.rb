class T < ActiveRecord::Base
    def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        T.create! row.to_hash
        end 
    end
end
  