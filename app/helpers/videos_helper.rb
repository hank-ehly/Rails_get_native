module VideosHelper


	def format_seconds(seconds)
		t = seconds
		mm, ss = t.divmod(60)
		return "%d:%d" % [mm, ss]
	end

	def getThumbnail(videoUrl)
		return "http://i1.ytimg.com/vi/" + videoUrl + "/default.jpg"
	end

end
