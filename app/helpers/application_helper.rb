module ApplicationHelper

	# Page Titles - Set individual page title elements
  # Accepts a String or Array.
  # Sets yield(:title) to a String for use in <title>.
  # 
  #   --Array--
  #   title ["Example", "Nashville, TN"]
  #   => "Example - Page - Title"
  # 
  #   --String--
  #   title "Example Page Title"
  #   => "Example Page Title"
  # 
  def title title_partials
    title = if title_partials.is_a? String
      title_partials
    elsif title_partials.is_a? Array
      title_partials.reject(&:blank?).join(' - ')
    end
    content_for(:title) { title }
  end


  # Display IcoMoon font icon
  # 
  def icon key
    raw "<i data-icon=&#x#{h(key)}></i>"
  end
  
  
  # Link to tel:########## if mobile
  # 
  def phone_link phone_num
    is_mobile_device? ? "tel:#{phone_num}" : "#contact"
  end


  # Daily special ID
  # 
  def day_id day
    "daily-specials-#{day[:title].downcase}"
  end
end
