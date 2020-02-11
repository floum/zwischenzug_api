class UsersController < ApplicationController
  before_action :authorize_request, except: [:create, :authenticate]

  def authenticate
    @user = User.find_by_username(params[:username])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def practice
    @puzzle = Puzzle.first
    render 'puzzles/show'
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :username, :password, :password_confirmation
    )
  end
end
