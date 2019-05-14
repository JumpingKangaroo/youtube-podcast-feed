class YoutubeVideosController < ApplicationController
  
  def new 
    @youtube_video = YoutubeVideo.new
  end

  def create
    @youtube_video = YoutubeVideo.new(user_params)
    @youtube_video.save
    redirect_to root_path
  end

  private
    def user_params
      params.require(:youtube_video).permit(:youtube_id)
    end

end
