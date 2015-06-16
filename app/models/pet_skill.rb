class PetSkill < ActiveRecord::Base
  belongs_to :battle_pet
  belongs_to :skill

  after_initialize :defaults

  def defaults
    self.level ||= 0
  end

end
