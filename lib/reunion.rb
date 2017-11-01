class Reunion
  attr_reader :location, :activities, :total_bill

  def initialize(location)
    @location = location
    @activities = []
    @participants = []
    @total_bill = {}
  end

  def add_activities(activity)
    @activities << activity
  end

  def add_up_activity_cost
    total_activity_cost = []
    @activities.map do |activity|
      total_activity_cost << activity.total_cost
    end
    total_activity_cost.sum
  end

  def add_up_participants
    @activities.map do |activity|
      parse_activity_participants(activity)
      end
    @participants.count
  end

  def parse_activity_participants(activity)
    activity.participants.map do |participant|
      unless @participants.include?(participant["name"])
        @participants << participant["name"]
      end
    end
  end

  def determine_cost_per_participant
    @activities.map do |activity|
      bill = activity.determine_who_owes
      @total_bill[activity.activity_name] = activity.determine_who_owes
    end
  end

  # def split_cost
  #   @total_bill
  # end

end
