# =======MODULES================ #

# Menu Module
module Menu
	
	def menu
		"What would you like to do? A) Add, S) Show, W) Write, R) Read or Q) Quit"
	end

end



# Promptable Module 
module Promptable

	def prompt(message, symbol = ':> ')
		print message
		print symbol
		gets.chomp
	end

end


# =======CLASSES================== #

# List Class
class List

	attr_reader :all_tasks

	def initialize
		@all_tasks = []
	end

	def add(task)
		@all_tasks << task
	end

	def show
		@all_tasks
	end

	def write_to_file(filename)
		IO.write(filename, @all_tasks.map(&:to_s).join("\n"))
	end

	def read_from_file(filename)
		IO.readlines(filename).each do |line|
			add(Task.new(line.chomp))
		end
	end

end	


# Task Class
class Task

	attr_reader :description

	def initialize(description)
		@description = description
	end

	def to_s
		@description
	end

end

# =======PROGRAM RUNNER================ #

if __FILE__ == $PROGRAM_NAME
	include Menu
	include Promptable
	list = List.new
	puts 'Please choose from the following list'
	until ['q'].include?(user_input = prompt(menu).downcase)
		case user_input
		when 'a'
			list.add(Task.new(prompt('What is the task would you like to accomplish?')))
		when 's'
			puts "Current To Do List:"
			puts list.show
		when 'w'
			list.write_to_file(prompt('What file would you like to write to?'))
		when 'r'
			list.read_from_file(prompt('Which file would you like to read?'))
			puts list.show
		else
			puts "Sorry I didn't catch that"
		end
		prompt('Press enter to continue', '')
	end
	puts 'Thanks for using the menu system!'
end






