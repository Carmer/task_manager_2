require_relative '../test_helper'

class TaskManagerTest <Minitest::Test
  def test_can_create_a_tas_with_an_id
    TaskManager.create({
              title: "mytask",
              description: "something"
              })
    task = TaskManager.find(1)
    assert_equal "mytask", task.title
    assert_equal "something", task.description
    assert_equal 1, task.id
  end

end
