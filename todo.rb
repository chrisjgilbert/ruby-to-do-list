
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


end


# Get program to load
if __FILE__ == $PROGRAM_NAME
          list = List.new
          puts 'You have created a new list'
          list.add(Task.new('Go shopping'))
          puts 'Your have added #{@description} to the task list!'
          puts list.show
        end 