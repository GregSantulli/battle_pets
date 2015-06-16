class BattlePet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :skills, through: :pet_skills
  has_many :pet_skills

  has_many :competitions, through: :pet_competitions
  has_many :pet_competitions

  after_create :initialize_pet_skills

  def attack(defender_name, skill_name='strength')
    defender = BattlePet.find_by_name(defender_name)
    skill = Skill.find_by_name(skill_name)
    competition = Competition.create(skill_id: skill.id)
    self.competitions << competition
    defender.competitions << competition
    # competition.evaluate
    EvaluationMessenger.evaluate(competition)
    # competition.evaluate
  end

  private

  def initialize_pet_skills
    p "in initialize_pet_skills"
    Skill.all.each do |skill|
      self.pet_skills.create(skill_id: skill.id)
    end
  end

end
