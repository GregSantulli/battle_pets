class Api::V1::CompetitionsController < ApplicationController
  before_action :authenticate
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
    respond_to do |format|
      format.json { render json: @competitions }
      format.xml { render xml: @competitions }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @competition }
      format.xml { render xml: @competition }
    end
  end

  def create
    @competition = Competition.new(competition_params)
    respond_to do |format|
      if @competition.save
        format.json { render json: @competition, status: :created }
        format.xml { render xml: @competition, status: :created }
      else
        format.json { render json: @competition.errors, status: :unprocessable_entity }
        format.xml { render xml: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @competition.update_attributes(competition_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @competition.errors, status: :unprocessable_entity }
        format.xml { render xml: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @competition.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
      format.xml { head :no_content, status: :ok }
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params[:competition]
  end

end
