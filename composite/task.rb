class Task
  attr_accessor :parent
  attr_reader :name

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end

  def total_num_of_tasks
    1
  end
end
