class Room < ApplicationRecord
    has_one_attached :room_image
    belongs_to :user, foreign_key: "user_id"
    has_many :reservations
    mount_uploader :avatar, AvatarUploader


    with_options on: :create do #ルーム登録時バリデーション
    validates :room_name,  presence: true
    validates :address,  presence: true
    validates :charge,  presence: true
    # validates :avatar,  presence: true #デフォルト画像表示のため
    end

end
