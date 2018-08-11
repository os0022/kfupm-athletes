class Match < ApplicationRecord
	belongs_to :user, class_name: "Match", optional: true
	has_many :bookings, dependent: :destroy
  has_one :student, class_name: "User"
  has_one :admin, class_name: "User"
	validates_presence_of :category, :position, :field, :start_time, :date, :num_of_player


	scope :category, -> (category) { where("category like ?", "%#{category}%") }
end
