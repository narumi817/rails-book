class ChangeTasksNameLimit30 < ActiveRecord::Migration[5.2]
  # change_column ではrollbackがうまくいかないので、up/down を実装する
  # 参考 : https://qiita.com/takuyanin/items/6d51ffb4078a417fed35
  def up
    change_column :tasks, :name, :string, limit: 30
  end
  def down
    change_column :tasks, :name, :string
  end
end
