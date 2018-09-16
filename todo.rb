# =======MODULES================ #
# Menu Module
module Menu
	
	def menu
		"What would you like to do? A) Add, U) Update, S) Show, D) Delete, W) Write, R) Read, T) Toggle status, or Q) Quit"
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
		@all_tasks.map.with_index(1) do |t, i|
      		"#{i}) #{t}"
    	end
	end

	def write_to_file(filename)
		machinified = @all_tasks.map(&:to_machine).join("\n")
		IO.write(filename, machinified)
	end

    def read_from_file(filename)
      IO.readlines(filename).each do |line|
        status, *description = line.split(':')
        status = status.include?('X')
        add(Task.new(description.join(':').strip, status))
      end
    end

	def delete(task_number)
		@all_tasks.delete_at(task_number-1)
	end

	def update(task_number, task)
		@all_tasks[task_number-1] = task
	end

	def toggle(task_number)
		@all_tasks[task_number-1].toggle_status
	end

end	

# Task Class
class Task

	attr_reader :description
	attr_accessor :status

	def initialize(description, status=false)
		@description = description
		@status = status
	end

	def to_s
		@description
	end

	def completed?
		@status
	end

	private

	def represent_satus
		@status == true ? "Completed: [X]" : "Completed: [ ]"
	end

	public

	def to_machine
		"#{completed? ? '[X]' : '[ ]'}" 
	end

	def toggle_status
		@completed_status = !completed?
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
		when 'u'
			puts list.show
			list.update(prompt('Which tasks would you like to update?').to_i, Task.new(prompt('What is your new task?')))
			puts "Updated List:"
			puts list.show
		when 's'
			puts "Current To Do List:"
			puts list.show
		when 'd'
			puts list.show
			list.delete(prompt('Which task would you like to delete?').to_i)
			puts "Updated List:"
			puts list.show
		when 'w'
			list.write_to_file(prompt('What file would you like to write to?'))
		when 'r'
			begin
				list.read_from_file(prompt('Which file would you like to read?'))
				puts list.show
			rescue
				puts "That file was not recognized!"
			end
		when 't'
			puts list.show
			list.toggle(prompt('Which taks would you like to toggle the status for?').to_i)
			puts list
		else
			puts "Sorry I didn't catch that"
		end
		prompt('Press enter to continue', '')
	end
	puts 'Thanks for using the menu system!'
end






