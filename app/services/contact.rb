class Contact
  def address
    "3065 Mallory Lane #115 | Franklin, Tn 37067"
  end

  def phone
    "615.771.9432"
  end

  def fax
    "615.771.9434"
  end

  def google_maps_url
    URI.encode "https://maps.google.com/?q=" + address.gsub("|", "").gsub(" ", "+")
  end

  def todays_hours
    time  = Time.zone.now
    hours = [
      "10:30a-2:30p", # Sunday
      "11a-8p",       # Monday
      "11a-8p",       # Tuesday
      "11a-8p",       # Wednesday
      "11a-8p",       # Thursday
      "11a-8p",       # Friday
      "11a-8p"        # Saturday
    ]
    hours[time.wday]
  end
end
