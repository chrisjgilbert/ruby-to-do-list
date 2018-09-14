# =======MODULES================ #

# Menu Module
module Menu
	
	def menu
		"What would you like to do? A) Add, S) Show, Q) Quit"
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
		else
			puts "Sorry I didn't catch that"
		end
	end
	puts 'Thanks for using the menu system!'
end






