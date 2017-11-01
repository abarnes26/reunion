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

     assert_equal "Volleyball", reunion.activities.first.activity_name
   end

end
