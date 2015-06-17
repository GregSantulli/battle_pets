class Api::V1::BattlePetsController < ApplicationController
  before_action :authenticate
  before_action :set_battle_pet, only: [:show, :update, :destroy, :attack]


  def index
    @battle_pets = BattlePet.all
    respond_to do |format|
      format.json { render json: @battle_pets }
      format.xml { render xml: @battle_pets }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @battle_pet }
      format.xml { render xml: @battle_pet }
    end
  end

  def create
    @battle_pet = BattlePet.new(battle_pet_params)
    respond_to do |format|
      if @battle_pet.save
        format.json { render json: @battle_pet, status: :created }
        format.xml { render xml: @battle_pet, status: :created }
      else
        format.json { render json: @battle_pet.errors, status: :unprocessable_entity }
        format.xml { render xml: @battle_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @battle_pet.update_attributes(battle_pet_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @battle_pet.errors, status: :unprocessable_entity }
        format.xml { render xml: @battle_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @battle_pet.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
      format.xml { head :no_content, status: :ok }
    end
  end

  def fight
    # trigger attack method on another battlepet
    respond_to do |format|
      format.json { render json: @battle_pet }
      format.xml { render xml: @battle_pet }
    end
  end

  private

  def set_battle_pet
    @battle_pet = BattlePet.find(params[:id])
  end

  def battle_pet_params
    params.require(:battle_pet).permit(:name)
  end

end
