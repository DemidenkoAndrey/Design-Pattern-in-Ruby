class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
    @old_contents = File.read(@path) if File.exists?(@path)
  end

  def execute
    File.open(@path, 'w') do |file|
      file.write(@contents)
    end
  end

  def unexecute
    if @old_contents
      File.open(@path, 'w') do |file|
        file.write(@old_contents)
      end
    else
      File.delete(@path) if File.exists?(@path)
    end
  end
end
