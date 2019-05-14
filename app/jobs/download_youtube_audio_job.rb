class DownloadYoutubeAudioJob < ApplicationJob
  queue_as :default

  def perform(id, video)
    downloadLocation = "/home/tempDownloads/#{id}.mkv"
    result = `youtube-dl -x --audio-format "mp3" -o "#{downloadLocation}" --restrict-filenames https://www.youtube.com/watch?v=#{id}`
    video.youtube_audio.attach(
      io: File.open("/home/tempDownloads/#{id}.mkv"),
      filename: "#{id}.mp3",
      content_type: 'audio/mpeg'
    )
    File.delete(downloadLocation) if File.exist?(downloadLocation)
  end
end
