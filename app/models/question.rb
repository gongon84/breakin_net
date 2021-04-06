class Question < ApplicationRecord
    #ユーザーと関連付け オプションでnull値を許可
    belongs_to :user, optional: true
end
