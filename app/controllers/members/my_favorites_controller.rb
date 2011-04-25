class Members::MyFavoritesController < Members::MembersController
  
    GNOMES_PER_PAGE = 5

    def index   
      @gnomes = Gnome.find_all_by_user_id(current_user.id).paginate(:page => params[:page], :per_page => GNOMES_PER_PAGE, :order => 'created_at DESC' )
      @num_gnomes = Gnome.find_all_by_user_id(current_user.id).count
      respond_to do |format|
        format.html
        format.xml  { render :xml => @roles }
      end

    end

end
