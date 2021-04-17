class Lesson < ApplicationRecord
    #関連付け
    belongs_to :user
    # has_many :comments, dependent: :delete_all
    # has_many :likes, dependent: :delete_all

    # 画像アップロード
    # mount_uploader :image_name, PlaceImageUploader

    # 同じ都道府県　かつ　同じ施設名は１つだけ
    validates :place, uniqueness: { scope: :pref}
end
