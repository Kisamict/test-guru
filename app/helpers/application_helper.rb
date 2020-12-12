module ApplicationHelper
  def footer_year
    Time.zone.now.year
  end

  def github_link(title, link)
    link_to title, link, target: '_blank'
  end

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
