class Room < ApplicationRecord
    has_one_attached :room_image
    belongs_to :user, foreign_key: "user_id"
    has_many :reservations
    mount_uploader :avatar, AvatarUploader

    # with_options on: :create do
    #     validates :room_introduction, length: {maximum: 140}
    #     validates :room_image, presence: true
    #     validates :address, presence: true
    #     validates :charge, presence: true
    #     validates :room_name, presence: true
    # end

    with_options on: :edit do
        validate :start_end_check
        def start_end_check
            unless
            self.start_date && self.end_date &&
            self.start_date < self.end_date
            errors.add(:endday, "は開始日より前の日付は登録できません。")
            end
        end
        validates :people, presence: true
        validates :start_date, presence: true
        validates :end_date, presence: true
    end


    def total_days
        (end_date - start_date) / 24 / 3600
    end
    def total_price
      charge * people * total_days
    end

end
