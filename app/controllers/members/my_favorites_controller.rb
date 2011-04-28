class Members::MyFavoritesController < Members::MembersController
  
    GNOMES_PER_PAGE = 5

    def index   
      @favoritization = Favoritization.find_all_by_user_id(current_user.id).paginate(:page => params[:page], :per_page => GNOMES_PER_PAGE, :order => 'created_at DESC' )
      @num_favoritization = Favoritization.find_all_by_user_id(current_user.id).count
      respond_to do |format|
        format.html
        format.xml  { render :xml => @roles }
      end
    end

	 def create
	   @favoritization = Gnome.new(params[:gnome])
		@favoritization.user = current_user
		respond_to do |format|
		  if @favoritization.save
		    flash[:success] = "#{@gnome.name} was successfully created."
			 format.html { redirect_to(members_gnomes_url) }
		    format.xml  { render :xml => @gnome, :status => :created, :location => @gnome }
		  else
		    flash[:error] = 'Gnome could not be created.'
		    format.html { render :action => "new" }
		    format.xml  { render :xml => @gnome.errors, :status => :unprocessable_entity }
		  end
	   end
	 end																						  
	 	

end
