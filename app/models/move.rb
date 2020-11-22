class Move < ApplicationRecord
    #ユーザーと関連付け
    belongs_to :user

    # バリデーション nilを許可する
    validates :skill, uniqueness: { scope: [:user_id, :title]}, allow_nil: true
    validates :limit, uniqueness: { scope: [:user_id, :title]}, allow_nil: true

    def user
        return User.find_by(id: self.user_id)
    end
end
