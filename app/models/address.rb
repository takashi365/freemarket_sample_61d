class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  validate :post_vali
  validate :city_vali
  validate :address_vali

def address_vali
  if address.blank?
    errors.add(:address, :blank)
  elsif address.match?(/1|2|3|4|5|6|7|8|9|0/)
    errors.add(:address, :format)
  end
end

def city_vali
  if city.blank?
    errors.add(:city, :blank)
  elsif city.match?(/1|2|3|4|5|6|7|8|9|0/)
    errors.add(:city, :format)
  end
end


  VALID_POST = /\A\d{3}[-]\d{4}\z/
  def post_vali
    if post_code.blank?
      errors.add(:post_code, :blank)
    elsif !VALID_POST.match?(post_code)
      errors.add(:post_code, :format)
    end
  end

end
