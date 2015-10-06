## To do: Implement CSV reading/writingi
require 'csv'
require 'pp'
class ContactDatabase
  class << self

    def list
      CSV.foreach('contacts.csv') { |row| puts "#{row[0]} (#{row[1]}) (ID:# #{row[2]}) #{row[3]}" }
    end

    def all
      CSV.open('contacts.csv').readlines
    end

    def size
      CSV.open('contacts.csv').readlines.length
    end

    def add(name, email, numbers = nil)
      new_line = [name, email, self.size, numbers]
      CSV.open('contacts.csv', 'a') << new_line
    end

    def show(id)
      CSV.foreach('contacts.csv') { |row| row.each {|array| puts array} if (id == row[2].to_i) }
    end

    def find(term)
      #may get false returns if the email contains numbers of the ID. could make ID longer or make this more specific but wont
      CSV.foreach('contacts.csv').select { |row| row.any?{ |value| value.include?(term) } }
    end

      #checks the database for duplicate emails
    def dupe?(email)
      CSV.foreach('contacts.csv') { |row| return true if row.include?(email) }
    end
  end
end
