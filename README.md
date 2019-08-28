# Youtube-Podcast-Feed

This project allows a user to add youtube videos to a custom rss podcast feed. 

* Currently, basic functionality is operational. The user is able to add a video, which then gets downloaded and is then served in the podcast feed. 

## Stuff used
* Rails version 5.2.3
* MySQL Server 
* [Skeleton](http://getskeleton.com/) CSS boilerplate
* [Youtube-dl](https://ytdl-org.github.io/youtube-dl/index.html) to fetch the videos, and uses ffmpeg to export the audio as mp3

## Screenshots
The main page allows the user to add a podcast with a custom title, view the list of currently added podcasts, and delete them:
![Main page screenshot](https://i.imgur.com/RhpT0BA.png)

The podcast feed:
![Podcast feed screenshot](https://i.imgur.com/br4XEC3.png)

## Future Features:
* File uploading
* Basic authentication
* Subscribing to a channel, with filters


