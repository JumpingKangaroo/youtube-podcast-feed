class CreateYoutubeVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :youtube_videos do |t|
      t.string :title
      t.string :youtube_id

      t.timestamps
    end
  end
end
