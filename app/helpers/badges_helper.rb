module BadgesHelper
  def badge_img_class(badge)
    "not-achieved" unless current_user.badges.include?(badge)
  end

  def badge_icon(badge)
    if current_user.badges.include?(badge)
      fa_icon "check-circle", class: "text-success float-right"
    else
      fa_icon "times-circle", class: "text-danger float-right"  
    end
  end
end
