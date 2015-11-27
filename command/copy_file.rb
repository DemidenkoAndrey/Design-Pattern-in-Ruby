require 'FileUtils'
class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    @contents = File.read(@target) if File.exists?(@target)
    FileUtils.copy(@source, @target) if File.exists?(@source)
  end

  def unexecute
    if @contents
      File.open(@target, 'w') do |file|
        file.write(@contents)
      end
    else
      File.delete(@target) if File.exists?(@target)
    end
  end
end
