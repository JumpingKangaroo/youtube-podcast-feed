class FileHostController < ApplicationController

  def getVideoDownload
    @youtube_video = YoutubeVideo.find(params[:id])
    @document = @youtube_video.youtube_audio

    send_data @document.download, filename: @youtube_video.title + ".mp3", content_type: @document.content_type
  end

end
