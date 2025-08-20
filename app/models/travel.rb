class Travel < ApplicationRecord
  has_many :record, dependent: :destroy
  belongs_to :device
end
