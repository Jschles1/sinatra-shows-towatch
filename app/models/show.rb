class Show < ActiveRecord::Base
  belongs_to :user

  validates :name, :network, :weekday, :showtime, presence: true
end
