class YoutubeVideosController < ApplicationController
  
  def new 
    @youtube_video = YoutubeVideo.new
    @videos =  YoutubeVideo.all
  end

  def create
    @youtube_video = YoutubeVideo.new(user_params)
    @youtube_video.save
    redirect_to root_path
  end

  def destroy 
    @youtube_video = YoutubeVideo.find(params[:id])
    @youtube_video.destroy

    redirect_to root_path
  end

  private
    def user_params
      params.require(:youtube_video).permit(:youtube_id, :title)
    end

end
