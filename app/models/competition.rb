class Competition < ActiveRecord::Base

  validates :skill_id, presence: true

  after_initialize :defaults

  has_many :battle_pets, through: :pet_competitions
  has_many :pet_competitions

  belongs_to :skill

  def evaluate

    p "INSIDE COMETITION.EVALUATE"
    # p self.battle_pets
    # p self.skill
    # p self.battle_pets.first.pet_skills.where(skill_id: self.skill.id)
  end


  private

  def defaults
    self.complete ||= false
  end

end
