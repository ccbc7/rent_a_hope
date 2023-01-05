class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def total_price
    charge * people
  end
  
  def total_days
      end_day - start_day
  end

end
