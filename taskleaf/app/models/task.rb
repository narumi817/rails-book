class Task < ApplicationRecord
  # バリデーションの前に実行する処理を設定できる
  before_validation :set_nameless_name

  validates :name, presence: true, length: { maximum: 30 }
  # 自作のバリデーションを作った場合は validate にメソッド名を渡す
  validate :validate_name_not_including_comma

  belongs_to :user
  private
  def set_nameless_name
    if name.blank?
      self.name = '名前なし'
    end
  end

  def validate_name_not_including_comma
    # &. を使うことでnilの場合に例外が発生するのを回避できる
    # https://secret-garden.hatenablog.com/entry/2016/09/02/000000
    if name&.include?(',')
      errors.add(:name, 'にカンマを含めることはできません')
    end
  end
end
