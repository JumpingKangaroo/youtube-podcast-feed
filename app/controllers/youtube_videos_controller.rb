class YoutubeVideosController < ApplicationController
  public:
    def create
      youtube_video = YoutubeVideo.create(user_params)
      redirect_to root_path
    end

  private:
    def user_params
      params.require(:id)
    end

end
