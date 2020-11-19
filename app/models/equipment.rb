class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :category, :location, :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

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
