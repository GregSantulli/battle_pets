require 'securerandom'

class User < ActiveRecord::Base
  has_secure_password
  has_one :battle_pet

  before_create :set_auth_token

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
