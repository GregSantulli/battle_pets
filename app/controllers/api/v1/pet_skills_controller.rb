class Api::V1::PetSkillsController < ApplicationController
  before_action :authenticate
  before_action :set_pet_skill, only: [:show, :update, :destroy]


  def index
    @pet_skills = PetSkill.all
    respond_to do |format|
      format.json { render json: @pet_skills }
      format.xml { render xml: @pet_skills }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @pet_skill }
      format.xml { render xml: @pet_skill }
    end
  end

  def create
    @pet_skill = PetSkill.new(pet_skill_params)

    respond_to do |format|
      if @pet_skill.save
        format.json { render json: @pet_skill, status: :created }
        format.xml { render xml: @pet_skill, status: :created }
      else
        format.json { render json: @pet_skill.errors, status: :unprocessable_entity }
        format.xml { render xml: @pet_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet_skill.update_attributes(pet_skill_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @pet_skill.errors, status: :unprocessable_entity }
        format.xml { render xml: @pet_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet_skill.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
      format.xml { head :no_content, status: :ok }
    end
  end

  private

  def set_pet_skill
    @pet_skill = PetSkill.find(params[:id])
  end

  def pet_skill_params
    params.require(:pet_skill).permit(:level, :battle_pet_id, :skill_id)
  end

end
