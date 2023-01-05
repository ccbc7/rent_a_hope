class Room < ApplicationRecord
    has_one_attached :room_image
    belongs_to :user
    has_many :reservations
    with_options on: :create do
        validates :room_introduction, length: {maximum: 140}
        validates :room_image, presence: true
        validates :adress, presence: true
        validates :charge, presence: true
        validates :room_name, presence: true
    end

    with_options on: :edit do
        validate :start_end_check
        def start_end_check
            unless
            self.start_day && self.end_day &&
            self.start_day < self.end_day
            errors.add(:endday, "は開始日より前の日付は登録できません。")
            end
        end
        validates :people, presence: true
        validates :start_day, presence: true
        validates :end_day, presence: true
    end


    def total_days
        (end_day - start_day) / 24 / 3600
    end
    def total_price
      charge * people * total_days
    end

end
