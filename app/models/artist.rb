require 'json'
require 'open-uri'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, -> { distinct }, through: :songs

  validates :on_tour, inclusion: { in: [true, false] }

  validates :name, presence: true

  def fetch_artist_data
    response = open "https://randomuser.me/api/"
    data = JSON.parse(response.read)
    self.image_url = data['results'][0]['picture']['large']
    save!
  end

end
