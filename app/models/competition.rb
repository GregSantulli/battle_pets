require 'securerandom'

class Competition < ActiveRecord::Base

  validates :skill_id, presence: true

  after_initialize :defaults

  has_many :battle_pets, through: :pet_competitions
  has_many :pet_competitions

  belongs_to :skill

  def evaluate

    p "INSIDE COMPETITION.EVALUATE"

    competition_skill = Skill.find(self.skill_id)
    participants = self.battle_pets
    competitor_skills = get_skills(participants, competition_skill.id)
    winner_id = nil

    if !same_skill_level?(competitor_skills)
      winner_id = eval_by_skill_level(competitor_skills)
    else !same_experience_level?(participants)
      winner_id = eval_by_experience_level(participants)
    end

    self.winner_id = winner_id
    self.complete = true
    self.hash_id = SecureRandom.uuid.gsub(/\-/,'')
    self.save

    winner = BattlePet.find(winner_id)

    p "#{winner.name.upcase} WINS!!!"

    gain_skill(competitor_skills, winner_id)
    gain_experience(participants)

  end

  def get_skills(participants, skill_id)
    skills_array = []
    participants.each do |pet|
      pet_skill = pet.pet_skills.find_by_skill_id(skill_id)
      skills_array << pet_skill
    end
    skills_array
  end

  def same_skill_level?(pet_skills)
    p "checking for equal skill levels"
    first_pets_skill_level = pet_skills[0].level
    pet_skills.each do |pet_skill|
      return false if pet_skill.level != first_pets_skill_level
    end
    p "SAME SKILL LEVEL!"
    true
  end

  def same_experience_level?(battle_pets)
    p "checking for equal experience levels"
    first_pets_experience = battle_pets[0].experience
    battle_pets.each do |pet|
      return false if pet.experience != first_pets_experience
    end
    p "SAME EXPERIENCE LEVEL!"
    true
  end

  def eval_by_skill_level(pet_skills)
    p "Evaluating by skill"
    pool = []
    pet_skills.each do |skill|
      (skill.level + 1).times do
        pool << skill.battle_pet_id
      end
    end
    pool.sample
  end

  def eval_by_experience_level(battle_pets)
    p "Evaluating by experience"
    pool = []
    battle_pets.each do |pet|
      (pet.experience + 1).times do
        pool << pet.id
      end
    end
    pool.sample
  end

  def gain_skill(pet_skills, winner_id)
    pet_skills.each do |skill|
      if skill.battle_pet_id == winner_id
        skill.increment(:level, by = 2)
        skill.save
      else
        skill.increment(:level, by = 1)
        skill.save
      end
    end
  end

  def gain_experience(battle_pets)
    battle_pets.each do |pet|
      pet.increment(:experience, by = 1)
      pet.save
    end
  end



  private

  def defaults
    self.complete ||= false
  end

end
