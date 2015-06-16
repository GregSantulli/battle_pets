class BattlePet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :user

  has_many :skills, through: :pet_skills
  has_many :pet_skills

  has_many :competitions, through: :pet_competitions
  has_many :pet_competitions

  after_initialize :defaults

  after_create :initialize_pet_skills

  def attack(defender_name, skill_name='strength')
    #get the two competitors
    defender = BattlePet.find_by_name(defender_name)
    skill = Skill.find_by_name(skill_name)
    #create a new competition
    competition = Competition.create(skill_id: skill.id)
    #add both competitiors to the competition
    self.competitions << competition
    defender.competitions << competition
    #send out competition id as message to be evaluated
    EvaluationMessenger.send_message(competition.id)
  end


  private


  def defaults
    self.experience ||= 0
  end

  def initialize_pet_skills
    p "in initialize_pet_skills"
    Skill.all.each do |skill|
      self.pet_skills.create(skill_id: skill.id)
    end
  end

end
