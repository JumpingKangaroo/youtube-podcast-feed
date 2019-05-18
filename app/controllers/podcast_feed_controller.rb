class PodcastFeedController < ApplicationController

  def showFeed
    @files = YoutubeVideo.all
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

end
