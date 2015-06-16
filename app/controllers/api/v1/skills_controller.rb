class Api::V1::SkillsController < ApplicationController
  before_action :authenticate
  before_action :set_skill, only: [:show, :update, :destroy]

  def index
    @skills = Skill.all
    respond_to do |format|
      format.json { render json: @skills }
      format.xml { render xml: @skills }
    end
  end


  def show
    respond_to do |format|
      format.json { render json: @skill }
      format.xml { render xml: @skill }
    end
  end

  def create
    @skill = Skill.new(skill_params)
    respond_to do |format|
      if @skill.save
        format.json { render json: @skill, status: :created }
        format.xml { render xml: @skill, status: :created }
      else
        format.json { render json: @skill.errors, status: :unprocessable_entity }
        format.xml { render xml: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @skill.update_attributes(skill_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @skill.errors, status: :unprocessable_entity }
        format.xml { render xml: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
      format.xml { head :no_content, status: :ok }
    end
  end

  private

    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name, :level, :battle_pet_id)
    end

end
