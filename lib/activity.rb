require 'pry'

class Activity
  attr_reader :activity_name, :participants

  def initialize(activity_name)
    @activity_name = activity_name
    @participants = []
  end

  def add_participant(participant)
    @participants << participant
  end

  def total_cost
    total_cost = []
    @participants.map do |participant|
      total_cost << participant["paid"]
    end
    total_cost
  end

end
