class UserPuzzlesController < ApplicationController
  before_action :authorize_request

  def create
    @puzzle = Puzzle.find(params[:puzzleId])

    UserPuzzle.create(user: @current_user, puzzle: @puzzle, success: params[:success])

    @current_user.unplan_puzzle(@puzzle)

    if not params[:success]
      @current_user.plan_puzzle(@puzzle)
    end
  end
end
