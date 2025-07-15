class Travel < ApplicationRecord
  has_many :record
  belongs_to :device
end
