class User < ApplicationRecord
  # 2つの属性が2つ追加される
  # password: ユーザが入力した生のパスワードを格納するための属性
  # password_confirmation: 確認用のパスワードを一時的に格納する
  # password, password_confirmation が一致しないとだめ
  has_secure_password 

  # https://railsguides.jp/active_record_validations.html
  # presence: 指定された属性が「空」でないことを検証する
  validates :name, presence: true
  # uniqueness: オブジェクトが保存される直前に属性の値が一意で重複してないことを検証する(SQL発行することで確認される)
  validates :email, presence: true, uniqueness: true
end
