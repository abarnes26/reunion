class Reunion
  attr_reader :location, :activities, :total_activity_cost

  def initialize(location)
    @location = location
    @activities = []
    @total_activity_cost = []
  end

  def add_activities(activity)
    @activities << activity
  end

  def add_up_activity_cost
    @activities.map do |activity|
      @total_activity_cost << activity.total_cost
    end
    @total_activity_cost.sum
  end


  
end
