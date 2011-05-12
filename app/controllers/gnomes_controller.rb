class GnomesController < ApplicationController

  def index
    @gnomes = Gnome.paginate(:page => params[:page], :order => 'created_at DESC')
    @num_gnomes = Gnome.count
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @gnomes }
    end
  end

  def show
    @gnome = Gnome.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @gnome }
    end
  end

  def new
    if current_user
      if current_user.role.name =="member"
        redirect_to new_member_gnome_path
      elsif current_user.role.name == "admin" || current_user.role.name == "developer"
        redirect_to new_admin_gnome_path
      end
    else
      redirect_to login_path
    end
  end

end
