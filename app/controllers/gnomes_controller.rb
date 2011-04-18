class GnomesController < ApplicationController

  GNOMES_PER_PAGE = 5

  def index
    @gnomes = Gnome.paginate(:page => params[:page], :per_page => GNOMES_PER_PAGE, :order => 'created_at DESC')
    @num_gnomes = Gnome.count
  end

  def show
    @gnome = Gnome.find(params[:id])
  end

  def new
    redirect_to login_path
  end

end
