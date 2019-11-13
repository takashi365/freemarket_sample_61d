class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_one :address
  accepts_nested_attributes_for :address
  validates :nickname, presence: { message: "ニックネームが入力されていません" }, length: { maximum: 12, message: "ニックネームが長すぎます" }, uniqueness: { message: "既に存在するニックネームです" }
  validates :email, presence: true,format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :family_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角のみで入力して下さい" }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角のみで入力して下さい" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :year, presence: true, length: { maximum: 4 }, format: { with: /\A[0-9]+\z/, message: "半角数字のみ" }
  validates :month, presence: true, length: { maximum: 2 }, format: { with: /\A[0-9]+\z/, message: "半角数字のみ" }
  validates :day, presence: true, length: { maximum: 2 }, format: { with: /\A[0-9]+\z/, message: "半角数字のみ" }

end
