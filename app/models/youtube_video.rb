class YoutubeVideo < ApplicationRecord
  has_one_attached :youtube_audio
  validates :youtube_id, presence: true

  after_save :queue_download_job

  private 
  def queue_download_job
    DownloadYoutubeAudioJob.perform_later self.youtube_id, self
  end

end
