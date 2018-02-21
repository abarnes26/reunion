class Activity
  attr_reader :participants, :cost
  def initialize(name, cost)
    @name = name
    @participants = []
    @cost = cost
  end

  def add_participant(name, paid)
    @participants << {name: name, paid: paid, owe: nil}
  end

  def cost_per_person
    @cost/@participants.size
  end



end
