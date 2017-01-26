class DiscsController < ApplicationController

  def index
    @discs = current_user.discs.all
    @public_discs = Disc.all
  end
  
end
