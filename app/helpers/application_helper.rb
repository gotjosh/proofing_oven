module ApplicationHelper

  def dummy_image(width, height, bg_color="cccccc", fg_color="333333")
    "http://dummyimage.com/#{width}X#{height}/#{bg_color}/#{fg_color}"
  end

  def humanize_boolean(bool)
    bool ? "Yes" : "No"
  end

end
