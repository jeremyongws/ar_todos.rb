require_relative 'config/application'
require_relative 'app/models/task'
require_relative 'app/models/list'
require 'byebug'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class Console

  def self.run!
    @command_line_input = ARGV
    @method_to_run = @command_line_input[0]
    @description = @command_line_input[1..-1].join(" ")
    case @method_to_run
    when "add"
      add(@description)
    when "remove"
      remove(@description)
    when "complete"
      complete(@description)
    when "list"
      list
    when "list2"
      list2
    end
  end

  def self.add(description)
    a = Task.create taskname: @description, status: "Not Complete"
  end

  def self.remove(description)
    Task.all.each_with_index do |item, index|
      if index + 1 == description.to_i
        item.destroy
        puts "Task #{index + 1} #{item.taskname} deleted."
      end
    # Task.destroy(description.to_i)
    # Task.all.each_with_index do |x, index|
    #   x.id = index +1
    #   x.save
    # end
    end
  end

  def self.complete(description)
    a = Task.find(description.to_i + 1)
    a.complete!
    puts "Task #{a.taskname} marked as completed!"
  end

  def self.list
    Task.all.each_with_index do |item, index|
      if item.status == "Completed"
        mark = "[X]"
      else
        mark = "[ ]"
      end
      puts "#{mark} #{index + 1}. #{item.taskname}"
    end
  end

  def self.list2
    Task.all.each_with_index do |item, index|
      if item.status == "Completed"
        mark = "[X]"
      else
        mark = "[ ]"
      end
      puts "#{mark} #{item.id}, #{index + 1}. #{item.taskname}"
    end
  end
end

Console.run!