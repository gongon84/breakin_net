class Like < ApplicationRecord
    #ユーザーと関連付け
    belongs_to :user
    belongs_to :post

    # バリデーション
    validates :user_id, presence: true
    validates :post_id, presence: true
end
