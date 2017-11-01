require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_instantiates
    assert_instance_of Activity, Activity.new("Tennis")
  end

  def test_the_activity_has_a_name
    activity = Activity.new("Tennis")

    assert_equal "Tennis", activity.activity_name
  end

  def test_the_activity_has_participants
    activity = Activity.new("Tennis")

    assert_equal [], activity.participants
  end

  def test_you_can_add_participants_to_an_event
    activity = Activity.new("Tennis")
    activity.add_participant({"name" => "Chris",
                              "paid" => 14})

    assert_equal 1,       activity.participants.count
    assert_equal "Chris", activity.participants[0]["name"]
    assert_equal 14,      activity.participants[0]["paid"]
  end

  def test_an_activity_can_have_more_than_one_participant
    activity = Activity.new("Tennis")
    activity.add_participant({"name" => "Chris",
                              "paid" => 14})
    activity.add_participant({"name" => "Harrison",
                              "paid" => 16})


    assert_equal 2,          activity.participants.count
    assert_equal "Harrison", activity.participants[1]["name"]
    assert_equal 16,         activity.participants[1]["paid"]
  end

  def test_an_activity_has_a_total_cost
    activity = Activity.new("Tennis")
    activity.add_participant({"name" => "Chris",
                              "paid" => 14})
    activity.add_participant({"name" => "Harrison",
                              "paid" => 16})

    assert_equal 30, activity.total_cost
  end

  def test_an_activity_cost_can_be_split
    activity = Activity.new("Tennis")
    activity.add_participant({"name" => "Chris",
                              "paid" => 14})
    activity.add_participant({"name" => "Harrison",
                              "paid" => 16})

    assert_equal 15, activity.average_cost
  end

  def test_can_determine_who_owes_what
    activity = Activity.new("Tennis")
    activity.add_participant({"name" => "Chris",
                              "paid" => 14})
    activity.add_participant({"name" => "Harrison",
                              "paid" => 16})
    activity.determine_who_owes


    assert_equal 1, activity.tab["Chris"]
    assert_equal -1, activity.tab["Harrison"]
  end




end
