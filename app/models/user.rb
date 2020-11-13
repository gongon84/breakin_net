class User < ApplicationRecord
    # postと関連付け
    has_many :posts, dependent: :delete_all
    has_many :comments, through: :posts

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
