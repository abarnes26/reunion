class Activity
  attr_reader :participants
  def initialize(name)
    @name = name
    @participants = []
    @cost = 0
  end

  def add_participant(name, paid)
    @participants << {name: name, paid: paid}
  end
end
