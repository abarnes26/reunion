require 'pry'

class Activity
  attr_reader :activity_name, :participants, :tab

  def initialize(activity_name)
    @activity_name = activity_name
    @participants = []
    @tab = {}
  end

  def add_participant(participant)
    @participants << participant
  end

  def total_cost
    total_cost = []
    @participants.map do |participant|
      total_cost << participant["paid"]
    end
    total_cost.sum
  end

  def average_cost
    total_cost/(@participants.count)
  end

  def determine_who_owes
    @participants.map do |participant|
      @tab[participant["name"]] = (average_cost - participant["paid"])
    end
    @tab
  end
end
