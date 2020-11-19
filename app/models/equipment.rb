class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :category, :location, :price, presence: true
  CATEGORIES=[{
    name: "Outdoor activities",
    key: "rdzsifgnzxqpdzmrnvqz"
  },
  {
    name: "Winter sports",
    key: "zc1dddfvehfvajby6k2l"
  },
  {
    name: "Water sports",
    key: "lgvsilnnvawggycfmfic"
  },
  {
    name: "Indoor activities",
    key: "bzjrpyxuttyfhxfjvr3k"
  },
  {
    name: "Golf",
    key: "ndiskrdsdaxjyzhzxgd7"
  }]
end
