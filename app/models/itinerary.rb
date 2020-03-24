class Itinerary < ApplicationRecord
  belongs_to :mountain
  belongs_to :user
  has_many :coordinates, dependent: :destroy
  has_many :reviews
  has_many_attached :photos
  has_many :favorites

include PgSearch::Model
  pg_search_scope :search_by_name_and_mountain,
    against: [ :name],
    associated_against: {
      mountain: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
