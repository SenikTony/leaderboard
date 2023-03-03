class LeaderboardController < ApplicationController
  def index
    @leaderboard = LeaderBoard.new(params[:country]).rating
  end
end
