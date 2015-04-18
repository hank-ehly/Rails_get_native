module VideosHelper


	def format_seconds(seconds)
		t = seconds
		mm, ss = t.divmod(60)
		return "%d:%d" % [mm, ss]
	end

	def get_thumbnail(video_url)
		return "http://i1.ytimg.com/vi/" + video_url + "/default.jpg"
	end

end
