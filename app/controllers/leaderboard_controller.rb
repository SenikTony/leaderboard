class LeaderboardController < ApplicationController
  def index
    @leaderboard = if params[:country].blank? || params[:country].to_i < 0
                     User.global_rating
                   else
                     User.country_rating(params[:country])
                   end 
  end
end
