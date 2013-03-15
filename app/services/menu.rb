class Menu
  def plates
    @plates_data ||= plates_data
  end

  def todays_specials
    specials[todays_index]
  end

  def todays_index
    time = Time.zone.now
    time.wday
  end

  def specials
    @specials ||= begin
      menu_data = YAML.load_file Rails.root.join("config", "menu.yml")
      menu_data.map(&:symbolize_keys)
    end
  end

  def prev_day day
    index = index_of_day(day)
    return nil unless index
    if index == 0
      specials.last
    else
      specials.at(index-1)
    end
  end

  def next_day day
    index = index_of_day(day)
    return nil unless index
    if index == specials.size - 1
      specials.first
    else
      specials.at(index+1)
    end
  end

  def index_of_day day
    specials.index(day)
  end

private

  def plates_data
    {
      veggies: [
        { title: "3 veggie plate", price: "4.99" },
        { title: "4 veggie plate", price: "5.99" }
      ],
      meats: [
        { title: "meat only", price: "4.99" },
        { title: "meat + 1", price: "6.49" },
        { title: "meat + 2", price: "7.49" },
        { title: "meat + 3", price: "8.29" }
      ],
      drinks: [
        { title: "beverage", price: "1.49" }
      ]
    }
  end
end
