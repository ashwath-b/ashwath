class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, -> { distinct }, through: :songs

  validates :on_tour, inclusion: { in: [true, false] }

  validates :name, presence: true
end
