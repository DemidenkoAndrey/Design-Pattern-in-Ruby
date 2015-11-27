class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute
    @commands.each(&:execute)
  end

  def description
    @commands.inject("") do |description, command|
      "#{description}#{command.description}\n"
    end
  end

  def unexecute
    @commands.reverse.each(&:unexecute)
  end
end
