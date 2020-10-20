class Post < ApplicationRecord
    has_many :users, dependent: :delete_all

    # 同じ都道府県　かつ　同じ施設名は１つだけ
    validates :place, uniqueness: { scope: :pref}
end
