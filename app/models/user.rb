require 'securerandom'

class User < ActiveRecord::Base
  has_secure_password
  has_one :battle_pet

  before_create :set_auth_token

  def summon(battle_pet_name)
    pet_to_summon = BattlePet.find_by_name(battle_pet_name)
    pet_to_summon.user_id = self.id
    pet_to_summon.save
  end

  private

  def set_auth_token
    return if self.auth_token.present?
    self.auth_token = generate_auth_token
    p "inside set_auth_token"
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

end
