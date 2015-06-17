class Api::V1::UsersController < ApplicationController
  before_action :authenticate, only: [:index, :show, :update, :destroy]
  before_action :set_user, only: [:show, :update, :destroy, :summon]

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
        format.xml { render xml: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content, status: :ok }
      format.xml { head :no_content, status: :ok }
    end
  end

  def summon
    @battle_pet = BattlePet.find_by_name(user_params[:battle_pet])
    @battle_pet.user_id = @user.id
    @battle_pet.save
    respond_to do |format|
      format.json { render json: @battle_pet }
      format.xml { render xml: @battle_pet }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :battle_pet)
  end

end
