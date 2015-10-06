require_relative 'contact'
require_relative 'contact_database'
require 'csv'

#Command line. Does not loop.
ARGV
case ARGV[0]
  when 'help'
    puts "Here is a list of available commands:"
    puts "    new - Create a new contact"
    puts "    list - List all contacts"
    puts "    show - Show a contact"
    puts "    find - Find a contact"
  when 'new'
    #I am too lazy to change the text of the raised error : )
    puts "Please enter new contact email"
    new_email = STDIN.gets.chomp
    raise DuplicateEmail if ContactDatabase.dupe?(new_email)
    puts "Please enter new contact name"
    new_name = STDIN.gets.chomp
    new_number = 'pourquoi'
    #Trying to add 'limitless' phone numbers...
    numbers_list = []
      while new_number != 'no'
        puts "Add a cellphone? Yes or no"
        new_number = STDIN.gets.chomp.downcase
          case new_number
            when 'yes'
              puts "What type of phone"
                type_number = STDIN.gets.chomp.capitalize
              puts "What is the phone number?"
                phone_number = STDIN.gets.chomp.capitalize
              numbers_list << {type_number => phone_number}
              puts numbers_list
            when 'no'
              Contact.create(new_name, new_email, numbers_list)
          end
      end
  when 'list'
    Contact.list
  when 'all'
    Contact.all
  when 'find'
    Contact.find(ARGV[1])
  when 'show'
    Contact.show(ARGV[1].to_i)
end

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
