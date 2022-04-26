module ApplicationHelper
  def page_title(separator = " – ")
  	penname = (ENV['PENNAME'] == 'nikki') ? 'Nikki Hall' : 'Nicole Hall'
    [content_for(:title), penname].compact.join(separator)
  end

  def page_heading(title)
    content_for(:title){ title }
    # content_tag(:h1, title)
  end
end
