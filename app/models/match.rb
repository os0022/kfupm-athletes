class Match < ApplicationRecord
	belongs_to :user
	has_many :bookings, dependent: :destroy


	scope :category, -> (category) { where("category like ?", "%#{category}%") }
end
