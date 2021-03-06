class Itinerary < ApplicationRecord
  ASCENTDIFFICULTIES = ["R", "F", "PD", "AD", "D"]
  SKIDIFFICULTIES = ["1.1", "1.2","1.3","2.1","2.2","2.3","3.1","3.2","3.3","4.1","4.2","4.3", "5.1", "5.2", "5.3"]
  TERRAINDIFFICULTIES = ["E1", "E2", "E3", "E4"]
  belongs_to :mountain
  belongs_to :user
  has_many :coordinates, dependent: :destroy
  has_many :reviews
  has_many_attached :photos

  validates :ascent_difficulty, presence: true,  inclusion: { in: ASCENTDIFFICULTIES }
  validates :ski_difficulty, presence: true,  inclusion: { in: SKIDIFFICULTIES }
  validates :terrain_difficulty, presence: true,  inclusion: { in: TERRAINDIFFICULTIES }


  has_many :favorites

  scope :filter_by_risk, -> (risk) { where risk: risk }
  scope :filter_by_mountain, -> (mountain) { where mountain: Mountain.find_by_name(mountain) }
  scope :filter_by_ascent_difficulty, -> (ascent_difficulty) { where ascent_difficulty: ascent_difficulty }
  scope :filter_by_ski_difficulty, -> (ski_difficulty) { where ski_difficulty: ski_difficulty }
  scope :filter_by_terrain_difficulty, -> (terrain_difficulty) { where terrain_difficulty: terrain_difficulty }


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

