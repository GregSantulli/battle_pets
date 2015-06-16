class PetCompetition < ActiveRecord::Base
  belongs_to :battle_pet
  belongs_to :competition
end
