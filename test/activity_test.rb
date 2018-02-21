require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("hiking", 30)
    assert_instance_of Activity, activity
  end

  def test_participants_hash
    activity = Activity.new("hiking", 30)
    assert_instance_of Array, activity.participants
  end

  def test_can_add_participants_to_hash
    activity = Activity.new("hiking", 30)
    assert_nil activity.participants.first

    activity.add_participant("Andrew", 5)
    assert_equal "Andrew", activity.participants.first[:name]
    assert_equal 5, activity.participants.first[:paid]
  end

  def test_can_add_participants_to_hash
    activity = Activity.new("hiking", 30)
    assert_nil activity.participants.first

    activity.add_participant("Andrew", 5)
    assert_equal "Andrew", activity.participants.first[:name]
    assert_equal 5, activity.participants.first[:paid]
  end

  def test_can_evaluate_total_cost
    activity = Activity.new("hiking", 30)

    assert_equal 30, activity.cost
  end



end
