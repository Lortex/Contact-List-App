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
      new_line = [name, email, id = generate_id, numbers]
      CSV.open('contacts.csv', 'a') << new_line
      return id
    end

    def show(id)
      CSV.foreach('contacts.csv').select { |row| row.any? {|value| value == id}}
    end

    def find(term)
      #may get false returns if the email contains numbers of the ID. could make ID longer or make this more specific but wont
      CSV.foreach('contacts.csv').select { |row| row.any?{ |value| value.include?(term) } }
    end

      #checks the database for duplicate emails
    def dupe?(email)
      CSV.foreach('contacts.csv') { |row| return true if row.include?(email) }
    end

      #generates a somewhat random id
    def generate_id
      self.size.to_s + ('A'..'Z').to_a.sample + (1..9).to_a.sample.to_s 
    end
  end
end
