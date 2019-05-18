require 'resque/server'

Rails.application.routes.draw do
  resources :youtube_videos
  
  mount Resque::Server, at: '/jobs'

  get '/files/:id', to: 'file_host#getVideoDownload'

  get '/feed', to: 'podcast_feed#showFeed'
  root 'youtube_videos#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
