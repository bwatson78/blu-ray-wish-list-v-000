class UserDiscsController < ApplicationController

  def publicize
    @disc = Disc.find(params[:id])
    @disc.user_discs.each do |user_disc|
      user_disc.pub = 1
      user_disc.save
    end
    if @disc.save
      redirect_to disc_path(@disc), alert: "Disc Saved!"
    else
      redirect_to disc_path(@disc), alert: "Disc Not Saved!"
    end
  end

end
