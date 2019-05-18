class DownloadYoutubeAudioJob < ApplicationJob
  queue_as :default
  
  def perform(id, video)
    # Use youtube-dl to download the video and convert to mp3 format
    puts "Starting job:"
    result = `youtube-dl -x --audio-format "mp3" -o '/home/tempDownloads/%(title)s-----%(id)s.%(ext)s' https://www.youtube.com/watch?v=#{id}`
    # Extract the video title from the console output
    expression = /\/home\/tempDownloads\/(.*?)-----/im
    title = (result.match expression)[1]
    puts "xxx" + title
    video.title = title
    # Attach the audio file to the given video with ActiveStorage
    video.youtube_audio.attach(
      io: File.open("/home/tempDownloads/#{title}-----#{id}.mp3"),
      filename: "#{id}.mp3",
      content_type: 'audio/mpeg'
    )
    video.save
    # Clean up the mp3 file from the download directory
    File.delete("/home/tempDownloads/#{title}-----#{id}.mp3")
  end
end