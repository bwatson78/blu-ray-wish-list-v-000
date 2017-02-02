class DiscsController < ApplicationController

  def index
    @discs = current_user.discs.all
    @public_discs = Disc.all
  end

  def new
    @disc = Disc.new
  end

  def create
    @disc = Disc.create(disc_params)
  end

  private

  def disc_params
  end


end
