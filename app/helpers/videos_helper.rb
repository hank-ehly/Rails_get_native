module VideosHelper


	def format_seconds(seconds)
		t = seconds
		mm, ss = t.divmod(60)
		return "%d:%d" % [mm, ss]
	end

end
