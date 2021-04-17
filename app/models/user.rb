class User < ApplicationRecord
  authenticates_with_sorcery!

  # postと関連付け
  has_many :posts, dependent: :delete_all
  has_many :comments, through: :posts
  has_many :moves, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :questions, dependent: :delete_all
  has_many :lessons, dependent: :delete_all

  # バリデーション
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true, # パスワード確認を使用
  if: -> { new_record? || changes[:crypted_password]} #　新規登録とパスワード変更のときだけ発動
end
