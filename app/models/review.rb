class Review < ApplicationRecord
  belongs_to :equipment
  validates :content, :rating, presence: true
end
