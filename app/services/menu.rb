class Menu
  def plates
    @plates_data ||= plates_data
  end

  def todays_specials
    time  = Time.zone.now
    specials[time.wday]
  end

  def specials
    @specials ||= begin
      menu_data = YAML.load_file Rails.root.join("config", "menu.yml")
      menu_data.map(&:symbolize_keys)
    end
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
