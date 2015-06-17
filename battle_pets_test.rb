require 'httparty'



new_user_response = HTTParty.post(
  'http://localhost:3000/api/v1/users',
  :body => {
    :user => {
      :name => 'Greg',
      :password => '1234',
      :password_confirmation => '1234',
    }
  }.to_json,
  :headers => { 'Content-Type' => 'application/json' }
)

new_user_json = JSON.parse(new_user_response.body)
AUTH_TOKEN = new_user_json["auth_token"]
USER_ID = new_user_json["id"]

p "New User auth token: #{AUTH_TOKEN}"


new_pet_response = HTTParty.post(
  'http://localhost:3000/api/v1/battle_pets',
  :body => {
    :battle_pet => {
      :name => 'NewPetName',
    }
  }.to_json,
  :headers => {
    'Content-Type' => 'application/json',
    "Authorization" => "Token token=\"#{AUTH_TOKEN}\""
  }
)

new_pet_json = JSON.parse(new_pet_response.body)

p "New Battle Pet '#{new_pet_json["name"]}' has been created"



#couldn't get the below to work

# summon_response = HTTParty.post(
#   "http://localhost:3000/api/v1/users/#{USER_ID}/summon/",
#   :body => {
#     :user => {
#       :battle_pet => 'pikachu',
#     }
#   }.to_json,
#   :headers => {
#     'Content-Type' => 'application/json',
#     "Authorization" => "Token token=\"#{AUTH_TOKEN}\""
#   }
# )

# p summon_response.body


