class Record < ApplicationRecord
  has_one :gyroscope
  has_one :accelerometer
  has_one :location
  has_one :user_accelerometer
  belongs_to :travel
  accepts_nested_attributes_for :accelerometer
  accepts_nested_attributes_for :gyroscope
  accepts_nested_attributes_for :user_accelerometer
  accepts_nested_attributes_for :location
end
