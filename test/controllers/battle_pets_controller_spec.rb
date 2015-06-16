require File.expand_path("../../test_helper", __FILE__)

describe BattlePetsController do

  # setup do
  #   @battle_pet = battle_pets(:one)
  # end

  describe "Battle Pets Controller" do

    it "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:battle_pets)
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create battle_pet" do
      assert_difference('BattlePet.count') do
        post :create, battle_pet: { name: @battle_pet.name }
      end

      assert_redirected_to battle_pet_path(assigns(:battle_pet))
    end

    it "should show battle_pet" do
      get :show, id: @battle_pet
      assert_response :success
    end

    it "should get edit" do
      get :edit, id: @battle_pet
      assert_response :success
    end

    it "should update battle_pet" do
      patch :update, id: @battle_pet, battle_pet: { name: @battle_pet.name }
      assert_redirected_to battle_pet_path(assigns(:battle_pet))
    end

    it "should destroy battle_pet" do
      assert_difference('BattlePet.count', -1) do
        delete :destroy, id: @battle_pet
      end
      assert_redirected_to battle_pets_path
    end
  end
end

