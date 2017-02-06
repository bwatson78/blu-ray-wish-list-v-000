module DiscsHelper

  def non_user_discs
    Disc.joins(:user_discs).where("user_discs.user_id != ?", current_user.id).where("user_discs.public == 1")
  end

end
