module ApplicationHelper

  def error_messages_for(object)
    render(:partial => "shared/error_messages", :locals => {:object => object})
  end

  def youtubeOptions

    params =
    {
      controls: 0,
      modestbranding: 1,
      showinfo: 0,
      autoplay: 1,
      loop: 1,
      playlist: @video_url,
      enablejsapi: 1
    }

    output = []

    params.each do |key, val|
      output << (key.to_s + "=" + val.to_s + "&")
    end

    # join the array and remove the last "&" symbol
    output.join[0...-1]

  end

end
