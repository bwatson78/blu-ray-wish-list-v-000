class DiscsController < ApplicationController

  def index
    @discs = current_user.discs.where(purchased: nil)
  end

  def new
    @disc = Disc.new
  end

  def create
    @disc = Disc.create(disc_params)
    if @disc.save
      current_user.discs << @disc
      current_user.save
      redirect_to @disc, alert: "Disc Saved!"
    else
      render :new, alert: "Your disc didn't save!"
    end
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def edit
    @disc = Disc.find(params[:id])
  end

  def update
    @disc = Disc.find(params[:id])
    if @disc.update(disc_params)
      redirect_to @disc, alert: "Disc Updated!"
    else
      redirect_to edit_disc_path(@disc), alert: "Disc Not Updated!"
    end
  end

  def destroy
    @disc = Disc.find(params[:id])
    if @disc.delete
      redirect_to root_path, alert: "Disc Deleted!"
    else
      redirect_to root_path, alert: "Disc Not Deleted!"
    end
  end

  def purchase
    disc = Disc.find(params[:id])
    disc.purchase
    redirect_to root_path
  end

  def owned
    @discs = current_user.discs.where(purchased: 1)
  end

  private

  def disc_params
    params.require(:disc).permit(
        :title,
        :pressing_year,
        :special_edition?,
        :amazon_url,
        :purchased?,
        user_discs_attributes: [:public],
        movie_attributes: [:title, :release_year, :imdb_url ,disc_id: :id])
  end


end
