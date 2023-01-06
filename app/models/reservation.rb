class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room


  with_options on: :create do
    validates :people,  presence: true
    validates :charge,  presence: true
  end

  def start_end_check
      unless
      self.start_date && self.end_date &&
      self.start_date < self.end_date
      errors.add(:endday, "は開始日より前の日付は登録できません。")
      end
  end
  validate :start_end_check


  def total_price
    charge * people
  end

  def total_days
      end_day - start_day
  end

end
