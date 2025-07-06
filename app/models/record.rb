class Record < ApplicationRecord
    has_one :gyroscope
    has_one :accelerometer
    has_one :location
    has_one :user_accelerometer
end