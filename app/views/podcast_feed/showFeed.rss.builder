title = "Personal Youtube Podcast Feed"
author = "Me lul"
description = "Feed for youtube videos that have been added"
ext = 'mp3'

#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.rss :version => "2.0" do
  xml.channel do
    xml.tag!("atom:link",  "href"=>"localhost:3000", "rel"=>"self", "type"=>"application/rss+xml") 
    xml.title title
    xml.link 'localhost:3000'
    xml.description description
    xml.language 'en'
    if @files.length != 0
      xml.pubDate @files.first.created_at.to_s(:rfc822)
      xml.lastBuildDate @files.first.created_at.to_s(:rfc822)

      @files.each do |file|
        xml.item do
          xml.title file.title
          # xml.description file.description
          xml.pubDate file.created_at.to_s(:rfc822)
          # #{file.file_name}
          # xml.enclosure :url => file.youtube_audio.blob.service_url(host: 'localhost:3000') , :length => '1', :type => 'application/mpeg'
          xml.enclosure :url => root_url + 'files/' + file.id.to_s, :length => '1', :type => 'application/mpeg'
          xml.link root_url + 'files/' + file.id.to_s
          # xml.guid({:isPermaLink => "false"}, file.permalink)
        end
      end
    end
  end
end
