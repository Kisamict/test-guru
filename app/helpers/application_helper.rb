module ApplicationHelper
  def footer_year
    Date.today.year
  end

  def github_link(title, link)
    link_to title, link, target: '_blank'
  end
end
