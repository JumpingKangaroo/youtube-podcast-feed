class DownloadYoutubeAudioJob < ApplicationJob
  queue_as :default

  def perform(id, video)
    result = `youtube-dl -x --audio-format "mp3" -o /home/tempDownloads/#{id}.mkv --restrict-filenames https://www.youtube.com/watch?v=#{id}`
    video.youtube_audio.attach(
      io: File.open("/home/tempDownloads/#{id}.mp3"),
      filename: "#{id}.mp3",
      content_type: 'audio/mpeg'
    )
    File.delete("/home/tempDownloads/#{id}.mp3") if File.exist?("/home/tempDownloads/#{id}.mp3")
  end
end
