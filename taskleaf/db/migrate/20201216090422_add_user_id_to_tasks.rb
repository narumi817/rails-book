class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    # 既存のタスクのuser_idに設定する値がわからないから、一旦tasksのデータを削除する
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
