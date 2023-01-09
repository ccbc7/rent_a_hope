class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  #予約時バリデーション
  validates :people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999}
  validates :charge,  presence: true
  validates :start_date,  presence: true
  validates :end_date,  presence: true


  validate :date_before_start #今日以前の日付禁止
  def date_before_start
    if
    self.start_date  && self.end_date &&
    self.start_date <= Date.yesterday
    errors.add(:start_date, "は今日以降のものを選択してください")
    end
  end

  validate :start_end_check #予約日日付逆転禁止
  def start_end_check
    if
    self.start_date > self.end_date
    errors.add(:end_date, "は開始日より前の日付は登録できません。")
    end
  end


end
