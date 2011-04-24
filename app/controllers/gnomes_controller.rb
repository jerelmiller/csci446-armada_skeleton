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
    if current_user
      if current_user.role.name =="member"
        redirect_to new_member_gnome_path
      elsif current_user.role.name == "admin" || current_user.role.name == "developer"
        redirect_to new_admin_gnome_path
    else
      redirect_to login_path
    end
  end

end
