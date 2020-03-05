class ShowsController < ApplicationController
  before_action :authenticate_user!
  def index
    @shows = Show.includes(:channel).all
    if params[:search].present?
      @shows = @shows.where("lower(shows.name) LIKE (?) OR lower(channels.name) LIKE (?)","%#{params[:search].strip.downcase}%","%#{params[:search].strip.downcase}%").references(:channels)
    end

  end


  def mark_as_favourite
    if params[:show_id].present?
      @favourite = Favourite.new
      @favourite.user_id = current_user.id
      @favourite.show_id = params[:show_id]
      if @favourite.save

        SendFavouriteShowWorker.perform_in(@favourite.show.play_time - 30.minutes, current_user.email, @favourite.show)

        flash[:success] = "Successfully marked as favourite"
      else
        flash[:error] = "Something went wrong"
      end
    else
      flash[:error] = "Parameters not present"
    end
    redirect_to shows_path
  end

end