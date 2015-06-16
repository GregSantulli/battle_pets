class Skill < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, inclusion: { in: %w(strength agility senses intelligence)}
  has_many :pet_skills
  has_many :battle_pets, through: :pet_skills
  has_many :competitions
end