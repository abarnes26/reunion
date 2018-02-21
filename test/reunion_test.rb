require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new("Colorado")

    assert_instance_of Reunion, reunion
  end

  def test_can_add_activities
    reunion = Reunion.new("Colorado")

    assert_equal [], reunion.activities

    reunion.add_activity("hiking", 20)
    assert_instance_of Activity, reunion.activities.first
    assert_equal "hiking", reunion.activities.first.name
    assert_equal 20, reunion.activities.first.cost

    reunion.add_activity("kayaking", 50)
    assert_equal 2, reunion.activities.size
    assert_equal "kayaking", reunion.activities.last.name
  end

  def test_can_evaluate_total_cost_of_reunion
    reunion = Reunion.new("Colorado")

    assert_equal 0, reunion.total_cost

    reunion.add_activity("hiking", 20)
    assert_equal 20, reunion.total_cost

    reunion.add_activity("kayaking", 50)
    assert_equal 70, reunion.total_cost
  end

end
