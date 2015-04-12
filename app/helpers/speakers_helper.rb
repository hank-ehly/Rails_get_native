module SpeakersHelper

  def full_name_of(speaker)
    if speaker
      speaker.first_name + " " + speaker.last_name
    end
  end

  def age_range_of(speaker)
    case speaker.age
    when 0
      "0~19"
    when 1
      "20~29"
    when 2
      "30~39"
    when 3
      "40~49"
    when 4
      "50~64"
    else
      "65+"
    end
  end

end
