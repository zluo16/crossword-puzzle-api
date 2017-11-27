class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.order(score: :desc).limit(5)
    render json: @users
  end

  def create
    @user = User.new(user_name: params[:user_name],
      score: 0,
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    if @user.save
      created_jwt = issue_token(id: @user.id)
      render json: { user: @user.id, jwt: created_jwt }
    else
      render json: {
        error: 'Username already exists'
      }, status: 422
    end
  end

  def update
    if @user.update(score: @user.score + params[:score])
      redirect_to api_v1_users
    else
      render json: {
        error: 'Score updating failed'
      }, status: 422
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :password_digest, :score)
    end
end
