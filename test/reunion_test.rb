require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

   def test_it_instantiates
     assert_instance_of Reunion, Reunion.new("place")
   end

   def test_it_has_a_location
     reunion = Reunion.new("Central Park")

     assert_equal "Central Park", reunion.location
   end

   def test_it_has_activities
     reunion = Reunion.new("Central Park")

     assert_equal [], reunion.activities
   end

   def test_it_add_new_activities
     reunion = Reunion.new("Central Park")
     activity = Activity.new("Volleyball")
     reunion.add_activities(activity)

     assert_equal 1, reunion.activities.count
     assert_equal "Volleyball", reunion.activities[0].activity_name
   end

   def test_it_can_take_multiple_activities
     reunion = Reunion.new("Central Park")
     activity1 = Activity.new("Volleyball")
     activity2 = Activity.new("Tennis")
     reunion.add_activities(activity1)
     reunion.add_activities(activity2)

     assert_equal 2, reunion.activities.count
     assert_equal "Volleyball", reunion.activities[0].activity_name
     assert_equal "Tennis", reunion.activities[1].activity_name
   end

   def test_it_can_total_costs_from_multiple_activites
     reunion = Reunion.new("Central Park")
     activity1 = Activity.new("Volleyball")
     activity1.add_participant({"name" => "Chris",
                                "paid" => 14})
     activity1.add_participant({"name" => "Harrison",
                                "paid" => 15})
     activity1.add_participant({"name" => "Katherine",
                                "paid" => 12})
     activity1.add_participant({"name" => "Joan",
                                "paid" => 19})
     activity2 = Activity.new("Tennis")
     activity2.add_participant({"name" => "Chris",
                                "paid" => 14})
     activity2.add_participant({"name" => "Harrison",
                                "paid" => 16})
     reunion.add_activities(activity1)
     reunion.add_activities(activity2)

     assert_equal 90, reunion.add_up_activity_cost
   end
end
