module SpeakersHelper

  def full_name_of(speaker)
    if speaker
      speaker.first_name + " " + speaker.last_name
    end
  end

  def age_of(speaker)
    case speaker.age
    when 0..19
      "0~19"
    when 20..29
      "20~29"
    when 30..39
      "30~39"
    when 40..49
      "40~49"
    when 50..64
      "50~64"
    else
      "65+"
    end
  end

end
