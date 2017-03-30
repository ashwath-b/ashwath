class Album < ActiveRecord::Base
  belongs_to :publisher
  has_many :songs

  validates :name, presence: true, length: { in: 2..50 }
  validates :cover_art, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
  scope :most_recent, ->(num) { order('released_on DESC').limit(num) }
  scope :recent, ->(num) { where('released_on > ?', Time.now - 14.weeks).limit(num).order('released_on DESC') }
end
