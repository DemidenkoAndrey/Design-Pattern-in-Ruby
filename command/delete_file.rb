class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    if File.exists?(@path)
      @contents = File.read(@path)
      File.delete(@path)
    end
  end

  def unexecute
    if @contents
      File.open(@path, 'w') do |file|
        file.write(@contents)
      end
    end
  end
end
