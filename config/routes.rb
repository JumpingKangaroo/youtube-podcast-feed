Rails.application.routes.draw do
  resources :youtube_videos

  root 'youtube_videos#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
