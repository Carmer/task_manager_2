require_relative '../test_helper'

class TaskTest < Minitest::Test
  def create_tasks(num)
    num.times do |x|
      TaskManager.create({ title: "my task#{x}", description: "description of task #{x}"})
    end
  end

  def test_it_finds_all
    create_tasks(5)
    tasks = TaskManager.all
    assert_equal 5, tasks.size
  end

  def test_it_can_find_by_id
    create_tasks(2)
    task = TaskManager.find(1)
    assert_equal "my task0", task.title
  end

  def test_it_can_update_a_task
    create_tasks(3)
    TaskManager.update(2, {title: "New Updated", description: "New Description"})
    task = TaskManager.find(2)
    assert_equal "New Updated", task.title
    assert_equal "New Description", task.description
  end

  def test_task_has_proper_attributes
    task = Task.new({"title" => "a title",
                      "description" => "tasks description",
                      "id" => 1
                      })
    assert_equal "a title", task.title
    assert_equal 1, task.id
    assert_equal "tasks description", task.description
  end

  def test_it_can_delete_a_task
    create_tasks(5)
    tasks1 = TaskManager.all
    assert_equal 5, tasks1.size
    TaskManager.destroy(4)
    tasks2 = TaskManager.all
    assert_equal 4, tasks2.size
    refute tasks1.size == tasks2.size
  end

end
