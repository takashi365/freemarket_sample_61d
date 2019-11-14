class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  has_one :address
  accepts_nested_attributes_for :address
  validates :nickname, presence: { message: "入力してください" }, length: { maximum: 12, message: "ニックネームが長すぎます" }, uniqueness: { message: "既に存在するニックネームです" }
  validates :email, presence: true
  validate :fa_name_kanji
  validate :fa_name_kana
  validate :fi_name_kanji
  validate :fi_name_kana
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

  VALID_FIKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  def fi_name_kana
    if first_name_kana.blank?
      errors.add(:first_name_kana, :blank)
    else !VALID_FIKANA_REGEX.match?(first_name_kana)
      errors.add(:first_name_kana, :format)
    end
  end
  
  VALID_FIKANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
  def fi_name_kanji
    if first_name_kanji.blank?
      errors.add(:first_name_kanji, :blank)
    else !VALID_FIKANJI_REGEX.match?(first_name_kanji)
      errors.add(:first_name_kanji, :format)
    end
  end

  VALID_FAKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  def fa_name_kana
    if family_name_kana.blank?
      errors.add(:family_name_kana, :blank)
    else !VALID_FAKANA_REGEX.match?(family_name_kana)
      errors.add(:family_name_kana, :format)
    end
  end

  VALID_FAKANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
  def fa_name_kanji
    if family_name_kanji.blank?
      errors.add(:family_name_kanji, :blank)
    else !VALID_FAKANJI_REGEX.match?(family_name_kanji)
      errors.add(:family_name_kanji, :format)
    end
  end

end
