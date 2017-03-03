class Show < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :network, presence: true
  validates :weekday, presence: true
  validates :showtime, presence: true
end
