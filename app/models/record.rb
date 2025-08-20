class Record < ApplicationRecord
  has_one :gyroscope, dependent: :destroy
  has_one :accelerometer, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :user_accelerometer, dependent: :destroy
  has_one :rating, dependent: :destroy

  belongs_to :travel

  accepts_nested_attributes_for :accelerometer
  accepts_nested_attributes_for :gyroscope
  accepts_nested_attributes_for :user_accelerometer
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :rating
end
