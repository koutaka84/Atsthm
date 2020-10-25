class Animal < ApplicationRecord
	belongs_to :user
	attachment :image
	validates :animal_name, presence: true
	has_many :likes
end
