class YoutubeVideo < ApplicationRecord
  has_one_attached :youtube_audio
  validates :youtube_id, presence: true
  validates :title, presence: true

  after_create :queue_download_job

  private 
  def queue_download_job
    if self.youtube_id != nil
      DownloadYoutubeAudioJob.perform_later self.youtube_id, self
    end 
  end

end
