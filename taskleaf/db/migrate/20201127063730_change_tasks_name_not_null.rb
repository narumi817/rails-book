class ChangeTasksNameNotNull < ActiveRecord::Migration[5.2]
  def change
    # change_column_null - 既存のテーブルの既存のカラムに対してNOT NULL制約を設定できる
    change_column_null :tasks, :name, false
  end
end
