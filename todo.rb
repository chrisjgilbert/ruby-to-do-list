# MODULEs ===========================================

module Menu
	
	def menu
		"Hello, welcome to Chris' To Do List!
		What would you like to do?
		A) Add
		S) Show
		Q) Quit"
	end

	def show
		menu
	end

end

module Promptable

	def prompt(message = 'What would you like to do?', symbol = ':> ')
		puts message
		puts symbol
		user_input = gets.chomp
	end

end


# CLASSES ===========================================

# List
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


# Task
class Task

	attr_reader :description

	def initialize(description)
		@description = description
	end

	def to_s
		@description
	end

end


# Program Runner
if __FILE__ == $PROGRAM_NAME

	# create new list
	my_list = List.new
	puts 'You have created a new list'
	# add new task to list
	puts 'Enter a task to add you your list'
	my_list.add(Task.new(gets.chomp))	
	# display list
	puts 'Your list: '
	puts my_list.show

end






