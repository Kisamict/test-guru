module ApplicationHelper
  def footer_year
    Time.zone.now.year
  end

  def github_link(title, link)
    link_to title, link, target: '_blank'
  end
end
