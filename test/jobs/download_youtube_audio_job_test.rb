require 'test_helper'

class DownloadYoutubeAudioJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'audio file downloads' do
    video = YoutubeVideo.create("Mj7IQZE092k")
    assert File.exists?("/home/tempDownloads")
end
