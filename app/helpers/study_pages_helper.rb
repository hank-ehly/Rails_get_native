module StudyPagesHelper

def findVideoUrlFromPlaylistVideo(playlistVideo)
	video = Video.find(playlistVideo.video_id)
	url_queries = Rack::Utils.parse_query URI(video.original_url).query
	video_url = url_queries["v"]
	return video_url
end

end
