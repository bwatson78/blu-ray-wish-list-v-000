class DiscsController < ApplicationController
  before_action :load_disc, only: [:show, :edit, :update, :destroy, :purchase]

  def index
    @discs = current_user.discs.where(purchased: nil)
    @non_user = non_user_discs.public_discs
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @discs}
    end
  end

  def new
    @disc = Disc.new
  end

  def create
    @disc = Disc.create(disc_params)
    if @disc.save
      current_user.discs << @disc
      current_user.save
      to_disc("Disc Saved!")
    else
      render :new, alert: "Your disc didn't save!"
    end
  end

  def show
    @movie = @disc.movies.build
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @disc}
    end
  end

  def edit
  end

  def update
    if @disc.update(disc_params)
      to_disc("Disc Updated!")
    else
      redirect_to edit_disc_path(@disc), alert: "Disc Not Updated!"
    end
  end

  def destroy
    if @disc.delete
      to_root("Disc Deleted!")
    else
      to_root("Disc Not Deleted!")
    end
  end

  def purchase
    @disc.purchase
    to_root("")
  end

  def owned
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

  def load_disc
    @disc = Disc.find(params[:id])
  end

  def to_disc(string)
    redirect_to @disc, alert: "#{string}"
  end

  def to_root(string)
    redirect_to root_path, alert: "#{string}"
  end

  def non_user_discs
    Disc.joins(:user_discs).where("user_discs.user_id != ?", current_user.id)
  end

end
