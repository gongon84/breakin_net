class Post < ApplicationRecord
    # 同じ都道府県　かつ　同じ施設名は１つだけ
    validates :place, uniqueness: { scope: :pref}
end
