class User < ApplicationRecord
    # パスワードのハッシュ化
    has_secure_password

    # postと関連付け
    has_many :posts, dependent: :delete_all
    has_many :comments, through: :posts
    has_many :moves, dependent: :delete_all
    has_many :likes, dependent: :delete_all
    has_many :questions, dependent: :delete_all

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
